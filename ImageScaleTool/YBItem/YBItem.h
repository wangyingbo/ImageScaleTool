//
//  YBItem.h
//  fmdbDemo
//
//  Created by fengbang on 2019/9/25.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

#define YB_CREATE_ITEM(tagInt,nameString) [YBItem create:tagInt name:nameString]

@interface YBItem : NSObject

@property (nonatomic, strong) NSNumber *tag;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat width;

+ (instancetype)create:(NSUInteger)tag name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
