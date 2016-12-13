//
//  Myview.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/4/5.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//

#import "Myview.h"

@implementation Myview

-(instancetype )initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
//        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
//        [self addSubview:btn];
    }
    return self;
}
-(void)configerWithData:(NSArray *)array

{
    for (int i=0; i<array.count; i++) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, i*(2+40), 60, 40)];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.tag =i+1;
        [btn addTarget:self action:@selector(dianji:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
   
}
-(void)dianji:(UIButton *)btn
{
    NSLog(@"btn.tag%ld",(long)btn.tag);
   
    //block的调用  当点击btn时调用这歌block 在viewcontroler实现要做的事情
    self.btnblock(btn.tag);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
