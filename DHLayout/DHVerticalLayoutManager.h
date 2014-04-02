//
//  VerticalLayoutManager.h
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHLayoutManager.h"
/**
 * vertical layout manager
 */
@interface DHVerticalLayoutManager : DHLayoutManager
//if YES, it will layout the next subview to another column
@property (nonatomic, assign) BOOL  enableAutoChangeColumn;
//when enable auto change column , columnWidth represent the width of each column
@property (nonatomic, assign) float columnWidth;
//the vertical direction space between two subviews
@property (nonatomic, assign) float space;

@end
