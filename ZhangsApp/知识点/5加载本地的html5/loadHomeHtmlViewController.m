//
//  loadHomeHtmlViewController.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/10/24.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//

#import "loadHomeHtmlViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface loadHomeHtmlViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;

@end

@implementation loadHomeHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.webView.delegate=self;
    
    [ self.view addSubview:self.webView ];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"index1"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    
    
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    context[@"changeStatusBar"] = ^(id str) {
        
        
        NSLog(@"changeStatusBar====%@",str);
    
        
    };
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
