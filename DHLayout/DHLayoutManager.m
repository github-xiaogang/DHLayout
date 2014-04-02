//
//  DHLayoutManager.m
//  Layout
//
//  Created by xiaogang zhang on 13-6-27.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import "DHLayoutManager.h"
#import "DHLayoutView.h"

@implementation DHLayoutManager
@synthesize view = _view;
@synthesize paddingLeft = _paddingLeft;
@synthesize paddingRight = _paddingRight; 
@synthesize paddingTop = _paddingTop;
@synthesize  paddingBottom = _paddingBottom; 


- (void) layout
{
    NSAssert(0, @"DHLayoutManager is an abstract class!  You should use its subclass(DHVerticalLayoutManager & DHHorizontalLayoutManager)");
}


@end
