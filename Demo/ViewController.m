//
//  ViewController.m
//  Demo
//
//  Created by fengshaobo on 2017/6/16.
//  Copyright © 2017年 fengshaobo. All rights reserved.
//

#import "ViewController.h"


static const CGFloat kAnimationDuration = 0.3;
#define kSearchTextAlpha 1

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testEmnu];
    
    self.array = [NSMutableArray array];
    [self addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [self.array addObject:@"xx"];
}

- (void)click {
    [self testThread];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testEmnu {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"value1",@"key1",
                          @"value2",@"key2",
                          @"value3",@"key3",nil];
    //通过枚举类枚举
    NSEnumerator *enumerator3 = [dict keyEnumerator];
    id key = [enumerator3 nextObject];
    while (key) {
        id obj = [dict objectForKey:key];
        NSLog(@"通过枚举类枚举--->%@",obj);
        key = [enumerator3 nextObject];
    }

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    id oldCount = change[NSKeyValueChangeOldKey];
    id newCount = change[NSKeyValueChangeNewKey];
    NSLog(@"old = %@, new = %@",oldCount, newCount);
}

- (void)testThread {
    dispatch_queue_t queue = dispatch_queue_create("my god", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"1 done");
    });
    
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"2 done");
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier");
    });
    
    dispatch_async(queue, ^{
        sleep(3);
        NSLog(@"3 done");
    });
}

@end
