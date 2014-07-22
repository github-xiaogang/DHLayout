//
//  UIView+Layout.m
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import "DHLayoutView.h"
#import "DHLayoutManager.h"
#import <objc/runtime.h>

@implementation DHLayoutView

@synthesize layoutManager = _layoutManager;

- (void)layoutSubviews
{
    if(self.layoutManager){
        [self.layoutManager layout];
    }
    else{ 
        [super layoutSubviews];
    }
}

- (void)layoutNow
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setLayoutManager:(DHLayoutManager *)layoutManager
{
    if(layoutManager && [layoutManager isKindOfClass:[DHLayoutManager class]] && layoutManager != _layoutManager){
        [_layoutManager release];
        _layoutManager = [layoutManager retain];
        _layoutManager.paddingTop = _paddingTop;
        _layoutManager.paddingLeft = _paddingLeft;
        _layoutManager.paddingBottom = _paddingBottom;
        _layoutManager.paddingRight = _paddingRight;
        [_layoutManager setView:self];
    }
}

- (void)setPaddingTop:(float)paddingTop
{
    _paddingTop = paddingTop;
    [_layoutManager setPaddingTop:_paddingTop];
}

- (void)setPaddingLeft:(float)paddingLeft
{
    _paddingLeft = paddingLeft;
    [_layoutManager setPaddingLeft:_paddingLeft];
}

- (void)setPaddingRight:(float)paddingRight
{
    _paddingRight = paddingRight;
    [_layoutManager setPaddingRight:_paddingRight];
}

- (void)setPaddingBottom:(float)paddingBottom
{
    _paddingBottom = paddingBottom;
    [_layoutManager setPaddingBottom:_paddingBottom];
}

- (void)dealloc
{
    [_layoutManager release];
    [super dealloc];
}

@end
