//
//  AnimotionViewController.m
//  CheckCheck
//
//  Created by zhangchaunwei on 16/3/29.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//

#import "AnimotionViewController.h"
#import "Myview.h"
#define Wi [UIScreen mainScreen].bounds.size.width
#define Hi [UIScreen mainScreen].bounds.size.height
@interface AnimotionViewController ()
{
    Myview *_view;
}
@property(nonatomic,strong)UIImageView *image;

@end

@implementation AnimotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake((Wi-50)/2, 100, 50,100)];
    image.image=[UIImage imageNamed:@"ff_IconShowAlbum"];
    image.backgroundColor=[UIColor yellowColor];
    self.image=image;
 
    [self.view addSubview:image];
    
    for (int i=0; i<4; i++) {
        
        CGFloat wdith=(Wi-50)/4;
        UIButton  *btn=[[UIButton alloc]initWithFrame:CGRectMake(10+i*(10+wdith), Hi-80,wdith , 40)];
        btn.tag=10+i;
        [btn setTitle:[NSString stringWithFormat:@"basic%d",i+1] forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor redColor];
        
        [btn addTarget:self action:@selector(beginAniotion:) forControlEvents:UIControlEventTouchUpInside];
        if (i==3) {
            [btn setTitle:@"动画" forState:UIControlStateNormal];
        }
        [self.view addSubview:btn];
    }
    
    NSArray *array=@[@"翻转动画",@"CATransition",@"3"];
    _view=[[Myview alloc]initWithFrame:CGRectMake(-100, 100, 100, 100)];
    
    [_view configerWithData:array];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)beginAniotion:(UIButton *)btn
{
    
    if (btn.tag==10) {
        NSLog(@"btn.tag%ld",(long)btn.tag);
        // 对Y轴进行旋转  X轴 （指定Z轴的话，就和UIView的动画一样绕中心旋转）
        CABasicAnimation *rotation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotation.duration = 2.5; // 持续时间
        rotation.repeatCount = 1; // 重复次数
//        rotation.autoreverses=YES;  //是否做逆动画 
        // 设定旋转角度
        rotation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
        rotation.toValue = [NSNumber numberWithFloat: 0.6*M_PI]; // 终止角度
        rotation.removedOnCompletion=NO; //结束时是否移除试图
        rotation.fillMode = kCAFillModeForwards;
    
        //动画的熟虑
        
        rotation.timingFunction =[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
        
        // 添加动画
        [self.image.layer addAnimation:rotation forKey:@"rotate-layer"];
    }else if (btn.tag==11)
    {
        //移动
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        //动画的代理  可以实现结束之后的事件
        animation.delegate=self;
        animation.duration = 2.5; // 持续时间
        animation.repeatCount = 1; // 重复次数
        
        animation.fromValue = [NSValue valueWithCGPoint:_image.layer.position]; // 起始帧
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100,400)]; // 终了帧
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [_image.layer addAnimation:animation forKey:@"move-layer"];
        
    }else if (btn.tag==12)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        
        // 动画选项设定
        animation.duration = 2.5; // 动画持续时间
        animation.repeatCount = 1; // 重复次数
//        animation.autoreverses = YES; // 动画结束时执行逆动画
        // 动画结束后不变回初始状态
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        // 缩放倍数
        animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
        animation.toValue = [NSNumber numberWithFloat:2.0]; // 结束时的倍率
      
        // 添加动画  
        [_image.layer addAnimation:animation forKey:@"scale-layer"];
    }else if (btn.tag==13)
    {
       //其他的动画
      //1. UIview动画
 
        [self.view addSubview:_view];
        [UIView animateWithDuration:0.5 animations:^{
            _view.frame=CGRectMake(0, 100, 100, 100);
        }];
#pragma mark---block的实现  点击了btn会调用这个方法 类似代理
          NSLog(@"%@",self.view.subviews);
       __weak AnimotionViewController *weakSelf = self; //防止循环引用
        _view.btnblock=^(NSInteger *btntag){
           
            if (btntag==1) {
                
                [UIView beginAnimations:@"animation" context:nil];
                [UIView setAnimationDuration:1.0f];
                
                
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                //设置动画的速率
               [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:weakSelf.view cache:YES];
                
                /*
                 UIViewAnimationTransitionNone,
                 UIViewAnimationTransitionFlipFromLeft,
                 UIViewAnimationTransitionFlipFromRight,
                 UIViewAnimationTransitionCurlUp,
                 UIViewAnimationTransitionCurlDown,
                 */
                //给self.view 加动画 并设置动画样式
                
                
                [UIView commitAnimations];
                NSLog(@"第一个动画");
            }else  if (btntag==2) {
                CATransition *transition = [CATransition animation];
                transition.duration = 2.0f;
                transition.type = kCATransitionReveal;
                transition.subtype = kCATransitionFromTop;
                [weakSelf.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
                [weakSelf.view.layer addAnimation:transition forKey:@"animation"];
                NSLog(@"第2个动画");
            }else
            {
                NSLog(@"第3个动画");
            }
        };
        
    }
    
}


#pragma mark----动画的代理方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"1111111");
}

@end
