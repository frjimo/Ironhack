//
//  Memes.m
//  MemeRastreator
//
//  Created by Fran on 15/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "Memes.h"

@interface Memes ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation Memes


- (instancetype)initWithPlistFileName:(NSString *)fileName {
    self = [super init];
    if (self) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"memes" ofType:@"plist"];
        NSArray *memesUrls = [NSArray arrayWithContentsOfFile:path];
        
        for (NSString *s in memesUrls ){
            Meme *m = [[Meme alloc]init];
            m.url = s;
            //[self.list addObject:m];
            [self addElement:m];
        }
    }
    return self;
}



//---------------------------------------------------Lazy Getter---------------------------

- (NSMutableArray *)list{
    if(!_list){
        _list = [[NSMutableArray alloc]init];
    }
    return _list;
}

//---------------------------------------------------Protocolo---------------------------

- (void)addElement:(Meme *)element{
    [self.list addObject:element];
}

- (NSUInteger)count{
    return self.list.count;
}

- (NSArray <Meme *>*)allElements{
    return self.list;
}

- (void)removeElement:(Meme *)element{
    [self.list removeObject:element];
}

- (Meme *)randomElement{
    if ([self count] == 0){
        return nil;
    }
    
    int i = arc4random() % [self count];
    return [self.list objectAtIndex:i];
}

@end
