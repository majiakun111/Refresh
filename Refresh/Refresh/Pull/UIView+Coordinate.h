//
//  UIView+Coordinate.h
//  HappyLive
//
//  Created by Ansel on 14-12-11.
//  Copyright (c) 2014年 4399.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Coordinate)

- (CGFloat)top;
- (void)setTop:(CGFloat)top;

- (CGFloat)left;
- (void)setLeft:(CGFloat)left;

- (CGFloat)bottom;

- (CGFloat)right;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)centerY;

@end
