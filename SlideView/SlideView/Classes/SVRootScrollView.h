//
//  SVRootScrollView.h
//  SlideView
//
//  Created by Chen Yaoqiang on 13-12-27.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVRootScrollView : UIScrollView <UIScrollViewDelegate>
{
    NSArray *viewNameArray;
    CGFloat userContentOffsetX;
    BOOL isLeftScroll;
}
@property (nonatomic, retain) NSArray *viewNameArray;

+ (SVRootScrollView *)shareInstance;

- (void)initWithViews;
/**
 *  加载主要内容
 */
- (void)loadData;

@end
