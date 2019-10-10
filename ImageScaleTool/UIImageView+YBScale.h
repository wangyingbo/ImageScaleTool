//
//  UIImageView+YBScale.h
//  ImageScaleTool
//
//  Created by fengbang on 2019/10/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (YBScale)

- (CGSize)yb_fitImage:(UIImage *)image maxWidth:(CGFloat)maxWidth;

- (CGSize)yb_fitImage:(UIImage *)image maxHeight:(CGFloat)maxHeight;

- (CGSize)yb_fitImage:(UIImage *)image maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
