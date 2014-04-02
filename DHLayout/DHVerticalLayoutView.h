//
//  DHVerticalLayoutView.h
//  Ivoryer
//
//  Created by 张 小刚 on 13-7-24.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import "DHLayoutView.h"
/**
 * vertical layout view
 */

@interface DHVerticalLayoutView : DHLayoutView

@property (nonatomic, assign) BOOL  enableAutoChangeColumn;
@property (nonatomic, assign) float columnWidth;
@property (nonatomic, assign) float space;

@end
