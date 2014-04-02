//
//  UIView+Layout.m
//  Ivory
//
//  Created by 张小刚 on 13-11-13.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import "UIView+Layout.h"
#import <objc/runtime.h>
const char * dhLayoutMarginTop = "dhLayoutMarginTop";
const char * dhLayoutMarginLeft = "dhLayoutMarginLeft";
const char * dhLayoutMarginBottom = "dhLayoutMarginBottom";
const char * dhLayoutMarginRight = "dhLayoutMarginRight";
const char * dhLayoutShouldBeLayout = "dhLayoutShouldBeLayout";


@implementation UIView (Layout)

- (void)setMarginTop:(float)marginTop
{
    objc_setAssociatedObject(self, dhLayoutMarginTop, [NSNumber numberWithFloat:marginTop], OBJC_ASSOCIATION_RETAIN);
}

- (float)marginTop
{
    return [objc_getAssociatedObject(self, dhLayoutMarginTop) floatValue];
}

- (void)setMarginLeft:(float)marginLeft
{
    objc_setAssociatedObject(self, dhLayoutMarginLeft, [NSNumber numberWithFloat:marginLeft], OBJC_ASSOCIATION_RETAIN);
}

- (float)marginLeft
{
    return [objc_getAssociatedObject(self, dhLayoutMarginLeft) floatValue];
}


- (void)setMarginBottom:(float)marginBottom
{
    objc_setAssociatedObject(self, dhLayoutMarginBottom, [NSNumber numberWithFloat:marginBottom], OBJC_ASSOCIATION_RETAIN);
}

- (float)marginBottom
{
    return [objc_getAssociatedObject(self, dhLayoutMarginBottom) floatValue];
}


- (void)setMarginRight:(float)marginRight
{
    objc_setAssociatedObject(self, dhLayoutMarginRight, [NSNumber numberWithFloat:marginRight], OBJC_ASSOCIATION_RETAIN);
}

- (float)marginRight
{
    return [objc_getAssociatedObject(self, dhLayoutMarginRight) floatValue];
}

- (void)setShouldBeLayout:(BOOL)shouldBeLayout
{
    objc_setAssociatedObject(self, dhLayoutShouldBeLayout, [NSNumber numberWithBool:shouldBeLayout], OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)shouldBeLayout
{
    return [objc_getAssociatedObject(self, dhLayoutShouldBeLayout) boolValue];
}

//code
- (id)ExchangeInitWithFrame:(CGRect)frame
{
    self = [self ExchangeInitWithFrame:frame];
    if(self){
        //default YES
        [self setShouldBeLayout:YES];
    }
    return self;
}

//xib
- (id)ExchageInitWithCoder: (NSCoder *)aDecoder
{
    self = [self ExchageInitWithCoder:aDecoder];
    if(self){
        //default YES
        [self setShouldBeLayout:YES];
    }
    return self;
}

/**
 * exchange method implement to set shouldBeLayout property default value YES at init time
 */
+ (void)load
{
    Method originInitWithFrame = class_getInstanceMethod([UIView class], @selector(initWithFrame:));
    Method newInitWithFrame = class_getInstanceMethod([UIView class], @selector(ExchangeInitWithFrame:));
    method_exchangeImplementations(originInitWithFrame, newInitWithFrame);
    Method originInitWithCoder = class_getInstanceMethod([UIView class], @selector(initWithCoder:));
    Method newInitWithCoder = class_getInstanceMethod([UIView class], @selector(ExchageInitWithCoder:));
    method_exchangeImplementations(originInitWithCoder, newInitWithCoder);
}

@end





















