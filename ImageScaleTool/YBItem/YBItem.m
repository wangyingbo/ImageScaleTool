//
//  YBItem.m
//  fmdbDemo
//
//  Created by fengbang on 2019/9/25.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "YBItem.h"


@interface YBItem ()

@end


@implementation YBItem

+ (instancetype)create:(NSUInteger)tag name:(NSString *)name {
    YBItem *item = [[YBItem alloc] init];
    item.tag = [NSNumber numberWithInteger:tag];
    item.name = name?:@"";
    return item;
}

@end
