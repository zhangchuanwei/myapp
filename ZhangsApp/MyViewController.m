//
//  MyViewController.m
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/4/5.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//

#import "MyViewController.h"
#import "AnimotionViewController.h"
#import "BlockViewController.h"
#import "ThreadViewController.h"
#import "loadHomeHtmlViewController.h"
#import "SearchViewController.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *Mytableview;
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation MyViewController

//懒加载table   先让fram 未zero
-(UITableView *)Mytableview
{
    if (_Mytableview==nil) {
        _Mytableview =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
    }
    return _Mytableview;
}

//懒加载数据源
-(NSArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=@[@"知识点1:动画",@"知识点2:Block",@"知识点3:多线程",@"知识点4:runloop",@"5.加载本地html",@"搜索加display"];
        
    }
    return _dataArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    NSLog(@"%@",self.dataArray[2]);
    self.Mytableview.dataSource=self;
    self.Mytableview.delegate=self;
    self.Mytableview.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.Mytableview];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString * indetifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indetifer];
    if (cell==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifer];
        
    }
    
    cell.textLabel.text=self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{  [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        AnimotionViewController *view=[[AnimotionViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }else if (indexPath.row==1)
    {
        BlockViewController *vc=[[BlockViewController alloc]init];
         [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row==2)
    {
        ThreadViewController *vc=[[ThreadViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row ==4)
    {
        loadHomeHtmlViewController *vc =[[loadHomeHtmlViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row ==5)
    {
        SearchViewController *vc =[[SearchViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
   
}
#pragma mark ----系统需要布局的时候会调用这个方法

-(void)viewDidLayoutSubviews
{
    
    if (44*self.dataArray.count>[UIScreen mainScreen].bounds.size.height-64) {
        self.Mytableview.frame=CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    }else
    {
        self.Mytableview.frame=CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width , 44*self.dataArray.count);
    }
}
@end
