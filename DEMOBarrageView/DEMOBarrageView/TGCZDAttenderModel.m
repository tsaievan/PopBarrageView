//
//  TGCZDAttenderModel.m
//  DEMO
//
//  Created by tsaievan on 17/10/2018.
//  Copyright © 2018 tsaievan. All rights reserved.
//

#import "TGCZDAttenderModel.h"

@implementation TGCZDAttenderModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
