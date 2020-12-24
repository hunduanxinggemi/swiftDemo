//
//  OCTool.m
//  SwiftTestDemo
//
//  Created by 杜浩然 on 2020/12/21.
//

#import "OCTool.h"
#import <SwiftTestDemo-Swift.h>

@implementation OCTool

- (void)showMeLog {
    
    NSLog(@"OC实例方法调用成功！！！");
    ListModel * model = [[ListModel alloc] initWithData:@{}];
    [model test];
    
}

+ (void)showMeAnotherLog {
    NSLog(@"OC类方法调用");
}

@end
