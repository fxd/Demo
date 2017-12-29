//
//  SellerProxy.m
//  Demo
//
//  Created by fengshaobo on 2017/7/1.
//  Copyright © 2017年 fengshaobo. All rights reserved.
//

#import "SellerProxy.h"
#import "BookSeller.h"
#import "ClotherSeller.h"

@interface SellerProxy()
@property (nonatomic, strong) BookSeller *bookSeller;
@property (nonatomic, strong) ClotherSeller *clotherSeller;
@property (nonatomic, strong) NSMutableDictionary *dict;

@end

@implementation SellerProxy

+ (SellerProxy *)proxy {
    return [SellerProxy alloc];
}

- (instancetype)init{
    _dict = [NSMutableDictionary dictionary];
    _bookSeller = [[BookSeller alloc] init];
    _clotherSeller = [[ClotherSeller alloc] init];
    
    //映射target及其对应方法名
    [self _registerMethodsWithTarget:_bookSeller];
    [self _registerMethodsWithTarget:_clotherSeller];
    
    return self;
}

- (void)_registerMethodsWithTarget:(id )target{
    
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
}

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSString *methodName = NSStringFromSelector(sel);
    id target = self.dict[methodName];
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    } else {
        return [super methodSignatureForSelector:sel];
    }
}
@end
