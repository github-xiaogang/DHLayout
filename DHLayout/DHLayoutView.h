//
//  UIView+Layout.h
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *DHLayoutView is a layout view that used to layout its subviews, it overrides UIView`s layoutSubviews method to provide its own layout, I provide two subclass, DHHorizontalLayoutView and DHVerticalLayoutView for you to use.
 */
@class DHLayoutManager;
@interface DHLayoutView : UIView
{
    @protected
    DHLayoutManager * _layoutManager;
}
@property (nonatomic, retain) DHLayoutManager * layoutManager;
@property (nonatomic, assign) float paddingLeft;
@property (nonatomic, assign) float paddingRight;
@property (nonatomic, assign) float paddingTop;
@property (nonatomic, assign) float paddingBottom;

/**
 * override UIView`s layoutSubviews to provide its own layout
 */
- (void)layoutSubviews;

/**
 * layout immediately
 */
- (void)layoutNow;
@end
