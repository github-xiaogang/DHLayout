//
//  VerticalLayoutManager.m
//  Layout
//
//  Created by xiaogang zhang on 13-6-26.
//  Copyright (c) 2013年 duohuo.net All rights reserved.
//
#ifndef IS_FLOAT_ZERO
#define IS_FLOAT_ZERO(f) (ABS(f) <= FLT_EPSILON)
#endif

#import "DHVerticalLayoutManager.h"
#import "DHLayoutView.h"
@implementation DHVerticalLayoutManager
@synthesize enableAutoChangeColumn = _enableAutoChangeColumn;
@synthesize columnWidth = _columnWidth;

- (void) layout
{
    float yOffset = 0.0f;
    int columnNo = 0;
    BOOL isNewColumn = NO;
    int validaCount = 0;  //有效subview个数

    yOffset += _paddingTop;
    isNewColumn = YES;
    for (int i=0; i<self.view.subviews.count; i++) {
        UIView * view = [self.view.subviews objectAtIndex:i];
        if(!view.shouldBeLayout ) continue;
        validaCount ++;
        if(!isNewColumn && (!IS_FLOAT_ZERO(_space) && IS_FLOAT_ZERO(view.marginTop))){
            yOffset += _space;
        }else{
            yOffset += view.marginTop;
        }
        view.top = yOffset;
        view.left = _paddingLeft + _columnWidth * columnNo + view.marginLeft;
        yOffset += view.height + view.marginBottom;
        if(_enableAutoChangeColumn){
            if(i < self.view.subviews.count-1){
                UIView * nextView = [self.view.subviews objectAtIndex:i+1];
                if(!view.shouldBeLayout) continue;
                float totalHeight = yOffset + ((!IS_FLOAT_ZERO(_space) && IS_FLOAT_ZERO(nextView.marginTop)) ? _space : nextView.marginTop) + nextView.height + nextView.marginBottom + _paddingBottom;
                if(totalHeight > self.view.height){
                    columnNo ++;
                    yOffset = _paddingTop;
                    isNewColumn = YES;
                }else{
                    isNewColumn = NO;
                }
            }
        }else{
            isNewColumn = NO;
        }
    }
    float realHeight = yOffset + _paddingBottom;    
    float realWidth =  (columnNo + 1) * _columnWidth;
    if(validaCount == 0){  //没有任何元素时
        realWidth = 0;
        realHeight = 0;
    }
    _contentSize.width = realWidth;
    _contentSize.height = realHeight;
    
    if(_enableAutoChangeColumn) {
        self.view.width = realWidth;
    }
    else{
        self.view.height = realHeight;
    }
}



@end







