//
//  UIView+Layout.h
//  Ivory
//
//  Created by 张小刚 on 13-11-13.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * add layout property to UIView, so all UIView can participate the layout process.
 */
@interface UIView (Layout)

@property (nonatomic, assign) float marginTop;
@property (nonatomic, assign) float marginLeft;
@property (nonatomic, assign) float marginBottom;
@property (nonatomic, assign) float marginRight;

/**
 * if No , this view will not be layout in the layout process, its position never change
 * default : YES
 */
@property (nonatomic, assign) BOOL shouldBeLayout;

@end
