


//
//  BlockViewController.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/4/6.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//    block 学习

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //实现图片的裁剪
//    再看看有什么好的方法
    UIButton *bt =[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [bt setImage:[UIImage imageNamed:@"启动页_01"] forState:UIControlStateNormal];
    bt.imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:bt];
    
    
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
