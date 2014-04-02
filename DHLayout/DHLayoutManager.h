//
//  DHLayoutManager.h
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import <Foundation/Foundation.h>
@class DHLayoutView;
/**
 * DHLayoutManager is used to do the actual job for DHLayoutView, it has a subclass DHHoritalLayoutManager for DHHorizontalLayoutView ,and DHVerticalLayoutManager for DHVerticalLayoutView
 */

@interface DHLayoutManager : NSObject
{
@protected
    float _paddingLeft;
    float _paddingRight;
    float _paddingTop;
    float _paddingBottom;
    CGSize _contentSize;
}

- (void) layout;

// inner use
@property (nonatomic, assign) UIView * view;

@property (nonatomic, assign) float paddingLeft;
@property (nonatomic, assign) float paddingRight;
@property (nonatomic, assign) float paddingTop;
@property (nonatomic, assign) float paddingBottom;

@end
