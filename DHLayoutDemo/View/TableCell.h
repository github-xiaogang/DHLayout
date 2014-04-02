//
//  TableCell.h
//  DHLayoutDemo
//
//  Created by 张小刚 on 13-11-25.
//  Copyright (c) 2013年 duohuo. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString * const TableCellId;
@interface TableCell : UITableViewCell

- (void)setData: (NSDictionary *)data;
+ (CGFloat)heightForData : (NSDictionary *)data;


@end
