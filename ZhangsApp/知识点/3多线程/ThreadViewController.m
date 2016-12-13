//
//  ThreadViewController.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/4/6.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
// 多线程
/*
 
 
 
 2.三种多线程技术的对比
 •NSThread:
 –优点：NSThread 比其他两个轻量级，使用简单
 –缺点：需要自己管理线程的生命周期、线程同步、加锁、睡眠以及唤醒等。线程同步对数据的加锁会有一定的系统开销
 
 •NSOperation：
 –不需要关心线程管理，数据同步的事情，可以把精力放在自己需要执行的操作上
 –NSOperation是面向对象的
 
 •GCD：
 –Grand Central Dispatch是由苹果开发的一个多核编程的解决方案。iOS4.0+才能使用，是替代NSThread， NSOperation的高效和强大的技术
 –GCD是基于C语言的
 
 */
#import "ThreadViewController.h"
#define kURL @"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"

@interface ThreadViewController ()
@property(nonatomic,strong)UIImageView *image;
@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     [self performSelectorInBackground:@selector(test) withObject:nil];
    self.image=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_image];
    //1.NSThread
    
    
    
//    优点：NSThread 比其他两个轻量级
//    缺点：需要自己管理线程的生命周期，线程同步。线程同步对数据的加锁会有一定的系统开销
    //两种创建方式
         // 1.1类方法
   
//    [NSThread detachNewThreadSelector:@selector(doSomething:) toTarget:self withObject:nil];
        //1.2实例方法  可以控制他的开始时机
     NSThread* myThread = [[NSThread alloc] initWithTarget:self
                                                   selector:@selector(doenLoadImage:)
                                                     object:kURL];
    
     NSLog(@"主线程");
     [myThread start];
  /*
   NSOperation
   优点：不需要关心线程管理，数据同步的事情，可以把精力放在自己需要执行的操作上。
   Cocoa operation 相关的类是 NSOperation ，NSOperationQueue。
   NSOperation是个抽象类，使用它必须用它的子类，可以实现它或者使用它定义好的两个子类：NSInvocationOperation 和 NSBlockOperation。
   创建NSOperation子类的对象，把对象添加到NSOperationQueue队列里执行。
   

   
   */
    //GCD
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//                   NSLog(@"全局队列%@",[NSThread currentThread]);
//        NSURL * url = [NSURL URLWithString:@"http://avatar.csdn.net/2/C/D/1_totogo2010.jpg"];
//        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
//        UIImage *image = [[UIImage alloc]initWithData:data];
//        if (data != nil) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.image.image = image;
//                NSLog(@"主线程队列%@",[NSThread currentThread]);
//            });
//        }   
//    });

}

-(void)doenLoadImage:(NSString *)url
{
    
    NSLog(@"%@分线程", [NSThread currentThread]);
   
    NSData *data=[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image=[UIImage imageWithData:data];
    
    if (image==nil) {
        
    }else
        
    {
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    }
}

-(void)updateUI:(UIImage*) image{
    NSLog(@"刷新ui");
    self.image.image = image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)test
{
    NSLog(@"我是在后台执行的");
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
