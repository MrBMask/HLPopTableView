//
// HLPopTableView.h
//  BMask
//
//  Created by BMask on 2017/11/22.
//  Copyright © 2017年 BMask. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HLPopTableView : UIView

@property(nonatomic, assign)BOOL isTop;
@property (nonatomic, copy) void(^sendStrBlock)(NSString *, NSInteger);


+ (instancetype)initWithFrame:(CGRect)frame dependView:(UIView *)view textArr:(NSArray *)textArr block:(void(^)(NSString * region_name, NSInteger index))block;

@end
