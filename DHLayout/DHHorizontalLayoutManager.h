//
//  HorizontalLayoutManager.h
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHLayoutManager.h"

/**
 * horizonal layout manager
 */
@interface DHHorizontalLayoutManager : DHLayoutManager
//if YES, it will layout the next subview to another line
@property (nonatomic, assign) BOOL  enableAutoChangeLine;
//when enable auto change line , lineHeight represent the height of each line
@property (nonatomic, assign) float lineHeight;
//the horizontal direction space between two subviews
@property (nonatomic, assign) float space;

@end
