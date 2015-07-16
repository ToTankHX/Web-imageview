//
//  ViewController.m
//  UIView
//
//  Created by admin on 15/7/16.
//  Copyright (c) 2015年 王珍杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //底层添加scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    self.scrollView.contentOffset = CGPointZero;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [imageView setBackgroundColor:[UIColor redColor]];
    [self.scrollView addSubview:imageView];
    
    
    //webview
    UIWebView* webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 600)];
    // NSString* path = @"http://www.baidu.com";
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"gold-baby_music" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webview loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
    webview.scrollView.scrollEnabled = NO;//关闭web自身scrollview
    webview.delegate = self;//add delegate
    [self.scrollView addSubview:webview];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    CGRect frame = webView.frame;
    frame.size.height = webView.scrollView.contentSize.height;
    webView.frame = frame;
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width,webView.frame.origin.y + webView.scrollView.contentSize.height)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
