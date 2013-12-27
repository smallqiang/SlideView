//
//  TestViewController.m
//  SlideView
//
//  Created by Chen Yaoqiang on 13-12-27.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImageView *topShadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, 320, 5)];
    [topShadowImageView setImage:[UIImage imageNamed:@"top_background_shadow.png"]];
    [self.view addSubview:topShadowImageView];
    
    SVTopScrollView *topScrollView = [SVTopScrollView shareInstance];
    SVRootScrollView *rootScrollView = [SVRootScrollView shareInstance];
    
    topScrollView.nameArray = @[@"网易新闻", @"新浪微博新闻", @"搜狐", @"头条新闻", @"本地动态", @"精美图片集"];
    rootScrollView.viewNameArray = @[@"网易新闻", @"新浪微博新闻", @"搜狐", @"头条新闻", @"本地动态", @"精美图片集"];
    
    [self.view addSubview:topScrollView];
    [self.view addSubview:rootScrollView];
    
    [topScrollView initWithNameButtons];
    [rootScrollView initWithViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
