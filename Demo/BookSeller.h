//
//  BookSeller.h
//  Demo
//
//  Created by fengshaobo on 2017/7/1.
//  Copyright © 2017年 fengshaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BookSellerPortocal

- (void)buyBook:(NSString *)title;

@end

@interface BookSeller : NSObject

@end
