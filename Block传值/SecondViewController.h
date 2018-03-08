//
//  SecondViewController.h
//  代理
//
//  Created by xunli on 2018/3/8.
//  Copyright © 2018年 caoji. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *设置Block
 */
typedef void (^SendValueBlock)(NSString* nameStr);
@interface SecondViewController : UIViewController
/**
 *定义一个block属性
 */
@property(nonatomic,copy)SendValueBlock block;
@end
