//
//  ViewController.m
//  NSCopy Practice
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import "Bank.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Bank *bank1 = [[Bank alloc]init];
    Bank *bank2 = [bank1 copy];
    
    NSLog(@"Banco 1: %@", bank1.description);
    NSLog(@"Banco 2: %@", bank2.description);
    
    
    NSMutableString *string1 = [NSMutableString stringWithString:@"Uno"];
    NSMutableString *string2 = [NSMutableString stringWithString:@"Dos"];
    NSMutableString *string3 = [NSMutableString stringWithString:@"Tres"];
    
    NSArray *strings1 = [[NSMutableArray alloc]initWithObjects:string1, string2, string3, nil];
    NSArray *strings2 = [[NSArray alloc ]initWithArray:strings1 copyItems:YES];
    
    [string1 appendString:@"one"];
    
    //----------------------------------------------------------------------------------------------------------s
    
    NSLog(@"Strings1: %@", strings1);
    NSLog(@"Strings2: %@", strings2);
    
    NSArray *array1  = @[[@"1" mutableCopy],[@"2" mutableCopy],[@"3" mutableCopy]];
    NSArray *array2 = [[NSArray alloc]initWithArray:array1 copyItems:YES];
    
    [array1[0] setString:@"Cambiado"];
    
    NSLog(@"Array1: %@",array1[0]);
    NSLog(@"Array2: %@",array2[0]);
    
}




@end
