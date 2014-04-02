//
//  DHVerticalLayoutView.m
//  Ivoryer
//
//  Created by 张 小刚 on 13-7-24.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//

#import "DHVerticalLayoutView.h"
#import "DHVerticalLayoutManager.h"

@implementation DHVerticalLayoutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //setup vertical layout manager
        [self setupLayoutManager];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    //setup vertical layout manager
    [self setupLayoutManager];
}

- (void)setupLayoutManager
{
    DHVerticalLayoutManager * layoutManager = [[DHVerticalLayoutManager alloc] init];
    layoutManager.enableAutoChangeColumn = _enableAutoChangeColumn;
    layoutManager.columnWidth = _columnWidth;
    layoutManager.space = _space;
    [self setLayoutManager:layoutManager];
    [layoutManager release];
}

- (void)setColumnWidth:(float)columnWidth
{
    _columnWidth = columnWidth;
    [(DHVerticalLayoutManager *)_layoutManager setColumnWidth:_columnWidth];
}

- (void)setEnableAutoChangeColumn:(BOOL)enableAutoChangeColumn
{
    _enableAutoChangeColumn = enableAutoChangeColumn;
    [(DHVerticalLayoutManager *)_layoutManager setEnableAutoChangeColumn:_enableAutoChangeColumn];
}

- (void)setSpace:(float)space
{
    _space = space;
    [(DHVerticalLayoutManager *)_layoutManager setSpace:_space];
}

@end














