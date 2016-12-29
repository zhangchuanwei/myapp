


//
//  BlockViewController.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/4/6.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//    block 学习

#import "BlockViewController.h"

@interface BlockViewController ()
@property(nonatomic) CGAffineTransform transform;   // default is CGAffineTransformIdentity. animatable

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //实现图片的裁剪
//    再看看有什么好的方法
    UIButton *bt =[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [bt setImage:[UIImage imageNamed:@"启动页_01"] forState:UIControlStateNormal];
    bt.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:bt];
    
    
    UIImageView *image=[[UIImageView alloc]init];
    
    image.frame =CGRectMake(100, 300, 100, 100);
    image.contentMode=UIViewContentModeScaleAspectFill;
    image.image =[UIImage imageNamed:@"启动页_01"];
//    [self.view addSubview:image];
    self.view.backgroundColor=[UIColor whiteColor];
    //第一
//  1.  声明一个Block
//    ^ 操作符声明一个块变量的开始（跟C一样用; 来表示表达式结束    blok可以调用同一作用域的局部变量
    int multiplier = 7;
    int (^myBlock)(int) = ^(int num) {
        return num * multiplier;
    };
    
    myBlock(3);
    //2.调用
    NSLog(@"%d",myBlock(3));
    
    //第二 传值见上个知识点的view
//    [UIView animateWithDuration:2 animations:^{
//        /*
//         以下三点结论基于未旋转的情况：
//         1.当参数x>0 && x<=M_PI时,为顺时针
//         2.当参数x>-M_PI && x<0时,为逆时针
//         3.若参数x<M_PI || x>2.0*M_PI时,则旋转方向等同于x%2的旋转方向
//         总结：旋转方向就是向最短路径方向旋转
//         */
//        bt.transform = CGAffineTransformMakeRotation(M_PI);// 顺时针旋转180度
//    }];
    
    [UIView animateWithDuration:2 delay:0.5 options:(UIViewAnimationOptionOverrideInheritedCurve) animations:^{
        bt.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
//            bt.transform = CGAffineTransformMake(1, 1, 1, 1, 1, 1);//自定义形变,参数自拟，下边会详细描述
        }];
    }];
    
//    [UIView animateWithDuration:2 animations:^{
//        bt.transform = CGAffineTransformMakeScale(2, 1);//宽高伸缩比例
//    }];
//    [UIView animateWithDuration:2 animations:^{
//        bt.transform = CGAffineTransformMakeTranslation(4, 6);//xy移动距离
//    }];
//    [UIView animateWithDuration:2 animations:^{
//        bt.transform = CGAffineTransformMake(1, 1, 1, 1, 1, 1);//自定义形变,参数自拟，下边会详细描述
//    }];
    
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
