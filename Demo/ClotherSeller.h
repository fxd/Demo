//
//  ClotherSeller.h
//  Demo
//
//  Created by fengshaobo on 2017/7/1.
//  Copyright © 2017年 fengshaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ClotherSellerPortocal

- (void)buyClother:(NSString *)brand;

@end

@interface ClotherSeller : NSObject

@end
