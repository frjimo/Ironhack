//
//  ViewController.m
//  BlocksPractice
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Fran. All rights reserved.
//



#import "ViewController.h"
#import "SimpleCounter.h"

typedef NSInteger (^FirstBlock) (NSInteger, NSInteger);
typedef void (^ThirdBlock) (NSInteger, NSInteger);



@interface ViewController ()

@property (nonatomic, copy) FirstBlock secondBlockProperty;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self firstBlock];
//    [self firstBlockTypeDef];
//    [self secondBlock];
//    [self thirdBlockMethod:^(NSInteger x, NSInteger y) {
//        NSLog(@"Valor x: %d, Valor y: %d\n",x,y);
//    }];
//    [self thirdBlockMethodTypeDef:^(NSInteger x, NSInteger y) {
//        NSLog(@"Valor x2+y2: %d\n",x+y);
//    }];
    
    SimpleCounter * counter = [[SimpleCounter alloc] init];
    //[counter countToTenThousandAndNotifyObserver:self withSelector:@selector(tenThousandCounts)];
    
    [counter countToTenThousandBlock:^(BOOL completed) {
        if (completed){
            NSLog(@"Fin");
        }
    }];
    
}

- (void)tenThousandCounts {
    NSLog(@"Fin");
}



- (void)firstBlock{
    NSInteger (^firstBlock)(NSInteger, NSInteger) = ^NSInteger(NSInteger a, NSInteger b){
        return a + b;
    };
    
    NSLog(@"Valor: %ld", (long)firstBlock(2,3));
}

- (void)firstBlockTypeDef{
    FirstBlock firstBlock  = ^NSInteger(NSInteger a, NSInteger b){
        return a + b;
    };
    
    NSLog(@"Valor: %ld", (long)firstBlock(2,3));
}

- (void)secondBlock {
    self.secondBlockProperty = ^NSInteger(NSInteger a, NSInteger b){
        return a + b;
    };
    NSLog(@"Valor: %ld",(long)self.secondBlockProperty(2,3));
}


- (void)thirdBlockMethod:(void (^)(NSInteger, NSInteger))thirdBlock {
    int x = arc4random() % 100;
    int y = arc4random() % 100;
    thirdBlock(x,y);
    
}

- (void)thirdBlockMethodTypeDef:(ThirdBlock)block {
    int x = arc4random() % 100;
    int y = arc4random() % 100;
    block(x,y);
}




@end
