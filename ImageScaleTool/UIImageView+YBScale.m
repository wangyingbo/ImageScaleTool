//
//  UIImageView+YBScale.m
//  ImageScaleTool
//
//  Created by fengbang on 2019/10/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "UIImageView+YBScale.h"

@implementation UIImageView (YBScale)

- (CGSize)yb_fitImage:(UIImage *)image maxSize:(CGSize)maxSize {
    NSParameterAssert(image);
    self.image = image;
    CGSize viewSize = self.frame.size;
    if (!image) { return viewSize; }
    
    CGSize fitSize = viewSize;
    CGFloat width = maxSize.width;
    CGFloat height = maxSize.height;
    if (viewSize.width<=maxSize.width) {
        width = viewSize.width;
    }
    if (viewSize.height<=maxSize.height) {
        height = viewSize.height;
    }
    
    CGSize imageSize = image.size;
    CGFloat imageRatio = imageSize.width/imageSize.height;
    CGFloat viewRatio = width/height;
    
    if (imageRatio>viewRatio) {
        CGFloat fitHeight = width/imageRatio;
        fitSize = CGSizeMake(width, fitHeight);
    }else {
        CGFloat fitWidth = height*imageRatio;
        fitSize = CGSizeMake(fitWidth, height);
    }
    
    return fitSize;
}


- (CGSize)yb_fitImage:(UIImage *)image maxWidth:(CGFloat)maxWidth {
    NSParameterAssert(image);
    self.image = image;
    CGSize viewSize = self.frame.size;
    if (!image) { return viewSize; }
    
    CGSize fitSize = viewSize;
    CGFloat width = maxWidth;
    if (viewSize.width <= maxWidth) {
        width = viewSize.width;
    }
    
    CGSize imageSize = image.size;
    CGFloat imageRatio = imageSize.width/imageSize.height;
    
    CGFloat height = width/imageRatio;
    fitSize = CGSizeMake(width, height);
    
    return fitSize;
}

- (CGSize)yb_fitImage:(UIImage *)image maxHeight:(CGFloat)maxHeight {
    NSParameterAssert(image);
    self.image = image;
    CGSize viewSize = self.frame.size;
    if (!image) { return viewSize; }
    
    CGSize fitSize = viewSize;
    CGFloat height = maxHeight;
    if (viewSize.height <= height) {
        height = viewSize.height;
    }
    
    CGSize imageSize = image.size;
    CGFloat imageRatio = imageSize.width/imageSize.height;
    
    CGFloat width = height*imageRatio;
    fitSize = CGSizeMake(width, height);
    
    return fitSize;
}


@end
