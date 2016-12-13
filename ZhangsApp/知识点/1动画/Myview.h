//
//  Myview.h
//  ZhangsApp
//
//  Created by zhangchaunwei on 16/4/5.
//  Copyright © 2016年 zhangchaunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Myview : UIView
@property(nonatomic,copy)void(^btnblock)(NSInteger *btnTag);
-(void)configerWithData:(NSArray *)array;
@end
