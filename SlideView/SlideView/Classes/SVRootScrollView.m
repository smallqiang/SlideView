//
//  SVRootScrollView.m
//  SlideView
//
//  Created by Chen Yaoqiang on 13-12-27.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import "SVRootScrollView.h"

#import "SVGloble.h"
#import "SVTopScrollView.h"

#define POSITIONID (int)(scrollView.contentOffset.x/320)

@implementation SVRootScrollView

@synthesize viewNameArray;

+ (SVRootScrollView *)shareInstance {
    static SVRootScrollView *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc] initWithFrame:CGRectMake(0, 44+IOS7_STATUS_BAR_HEGHT, 320, [SVGloble shareInstance].globleHeight-44)];
    });
    return _instance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.backgroundColor = [UIColor lightGrayColor];
        self.pagingEnabled = YES;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        userContentOffsetX = 0;
    }
    return self;
}

- (void)initWithViews
{
    for (int i = 0; i < [viewNameArray count]; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0+320*i, 0, 320, [SVGloble shareInstance].globleHeight-44)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:50.0];
        label.tag = 200 + i;
        if (i == 0) {
            label.text = [viewNameArray objectAtIndex:i];
        }
        [self addSubview:label];
    }
    self.contentSize = CGSizeMake(320*[viewNameArray count], [SVGloble shareInstance].globleHeight-44);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    userContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (userContentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调整顶部滑条按钮状态
    [self adjustTopScrollViewButton:scrollView];
    
    [self loadData];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self loadData];
}

-(void)loadData
{
    CGFloat pagewidth = self.frame.size.width;
    int page = floor((self.contentOffset.x - pagewidth/viewNameArray.count)/pagewidth)+1;
    UILabel *label = (UILabel *)[self viewWithTag:page+200];
    label.text = [NSString stringWithFormat:@"%@",[viewNameArray objectAtIndex:page]];
}

//滚动后修改顶部滚动条
- (void)adjustTopScrollViewButton:(UIScrollView *)scrollView
{
    [[SVTopScrollView shareInstance] setButtonUnSelect];
    [SVTopScrollView shareInstance].scrollViewSelectedChannelID = POSITIONID+100;
    [[SVTopScrollView shareInstance] setButtonSelect];
    [[SVTopScrollView shareInstance] setScrollViewContentOffset];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
