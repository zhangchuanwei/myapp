//
//  UiViewController.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/12/14.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//

#import "UiViewController.h"

@interface UiViewController ()<UIScrollViewDelegate>
{
    UIImageView *image;
}
@end

@implementation UiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor blackColor];
    self.mYlab.backgroundColor =[UIColor redColor];
    self.mYlab.text = @"[self.mYlab.layer setShadowColor:[UIColor blackColor].CGColor];";
    self.mYlab.highlighted =YES;//跟btn的高亮是一样的 只是一个窗台
    self.mYlab.highlightedTextColor = [UIColor orangeColor];
//    1。感觉这歌只能设文字的背景
    
//    [self.mYlab.layer setShadowColor:[UIColor blackColor].CGColor];
//    
//    [self.mYlab.layer setShadowOffset:CGSizeMake(1, 1)];
    
//  2.  在文字显示不了的时候才会有效果
    self.mYlab.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.mYlab.numberOfLines =0;
//    self.mYlab.adjustsFontSizeToFitWidth =YES;

//    UIBaselineAdjustmentAlignBaselines = 0,默认，文本最上端与中线对齐。
//    
//    UIBaselineAdjustmentAlignCenters,  文本中线与label中线对齐。
//    
//    UIBaselineAdjustmentNone, 文本最低端与label中线对齐。
//    13、 lineBreakMode 设置文字过长时的显示格式
    
    self.mYlab.lineBreakMode  = NSLineBreakByTruncatingMiddle;
//    label.lineBreakMode = NSLineBreakByCharWrapping;以字符为显示单位显示，后面部分省略不显示。
//    
//    label.lineBreakMode = NSLineBreakByClipping;剪切与文本宽度相同的内容长度，后半部分被删除。
//    
//    label.lineBreakMode = NSLineBreakByTruncatingHead;前面部分文字以……方式省略，显示尾部文字内容。
//    
//    label.lineBreakMode = NSLineBreakByTruncatingMiddle;中间的内容以……方式省略，显示头尾的文字内容。
//    
//    label.lineBreakMode = NSLineBreakByTruncatingTail;结尾部分的内容以……方式省略，显示头的文字内容。
//    
//    label.lineBreakMode = NSLineBreakByWordWrapping;以单词为显示单位显示，后面部分省略不显示。
   
    UIColor *titleColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"屏幕快照 2016-12-14 下午4.54.04.png"]];
    
    NSString *title = @"Settingtttaaajjjjjjaaaa";
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 200, 44)];
    
    titleLabel.textColor = titleColor;
    
    titleLabel.text = title;
    
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    titleLabel.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:titleLabel];
    
    titleLabel.layer.borderColor = [[UIColor redColor] CGColor];
    
    titleLabel.layer.borderWidth = 2;
    
    
    
    //btn
    UIButton * btn  =[UIButton buttonWithType:UIButtonTypeInfoDark];
    
    btn.frame =CGRectMake(CGRectGetMaxX(titleLabel.frame), CGRectGetMinY(titleLabel.frame), 50, 50);
    btn.showsTouchWhenHighlighted=YES;
    [self .view addSubview:btn];
    
    
    UIScrollView *scrView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, 200)];
    scrView.backgroundColor =[UIColor whiteColor];
    scrView.delegate=self;
    scrView.minimumZoomScale = 0.1;     // 最小缩放值
    scrView.maximumZoomScale = 10.0;    // 最大缩放值
    [scrView setZoomScale:scrView.minimumZoomScale];    // 初始时候的缩放值
    
    [self.view addSubview:scrView];
    
    
    image =[[UIImageView alloc]init];
    image.image =[UIImage imageNamed:@"img"];
    image.frame=CGRectMake(0, 0, image.image.size.width, image.image.size.height);
    
  
    scrView.contentSize=image.image.size;
    [scrView addSubview:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return image;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView

{
    //核心代码:设置内容大小
    
    //contentSize.height == 0 设置为0仅仅代表竖直方向上不能滚动
    
//    scrollView.contentSize = CGSizeMake(count * w, 0);
    
    
    //分页
    
    //每一页的尺寸都是跟scrollView的frame.size一样的
    
    scrollView.pagingEnabled = YES;
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
