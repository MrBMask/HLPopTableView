//
//  HLPopTableView.m
//  BMask
//
//  Created by BMask on 2017/11/22.
//  Copyright © 2017年 BMask. All rights reserved.
//

#import "HLPopTableView.h"
#import "UIView+HLExtension.h"

#define WINDOW [[[UIApplication sharedApplication] delegate] window]
#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHight  [UIScreen mainScreen].bounds.size.height

@interface HLPopTableView() <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSArray * arry;
@property(nonatomic, strong)UIView * backView;
@property(nonatomic, strong)UIView * showView;
@property(nonatomic, strong)UITableView * tableView;


@end


@implementation HLPopTableView

+ (instancetype)initWithFrame:(CGRect)frame dependView:(UIView *)view textArr:(NSArray *)textArr block:(void (^)(NSString *, NSInteger))block{
    HLPopTableView * popView = [[HLPopTableView alloc] initWithFrame:frame];
    popView.arry = textArr;
    popView.sendStrBlock = block;
    CGRect rect = [view convertRect:view.bounds toView:WINDOW];
    [popView frame:frame popUpFrame:rect];
    return popView;
    
}

- (void)frame:(CGRect)frame popUpFrame:(CGRect)popFrame{
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHight)];
    self.backView.backgroundColor = [UIColor clearColor];
//    self.backView.backgroundColor = [UIColor redColor];
    [WINDOW addSubview:self.backView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.backView addGestureRecognizer:tap];
    
    self.showView = [[UIView alloc] init];
    if (popFrame.origin.y + frame.size.height <= WINDOW.height - 30) {
        self.showView.frame = CGRectMake(popFrame.origin.x, popFrame.origin.y + popFrame.size.height , frame.size.width , frame.size.height );
    }
    if (popFrame.origin.y + frame.size.height > WINDOW.height - 30 ) {
        self.showView.frame = CGRectMake(popFrame.origin.x , popFrame.origin.y - frame.size.height, frame.size.width , frame.size.height );
    }
    
    self.showView.backgroundColor = [UIColor whiteColor];
//    self.showView.backgroundColor = [UIColor greenColor];
    self.showView.layer.borderWidth = 1;
    self.showView.layer.cornerRadius = 3;
    self.showView.layer.borderColor = [UIColor grayColor].CGColor;

    [WINDOW addSubview:self.showView];
    
    UITableView * popTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.showView.width, self.showView.height) style:UITableViewStylePlain];
    popTable.delegate = self;
    popTable.dataSource = self;
    popTable.tableFooterView = [[UIView alloc] init];
//    if (self.arry.count > 5) {
//        popTable.scrollEnabled = YES;
//    }else{
//        popTable.scrollEnabled = NO;
//    }
    self.tableView = popTable;
    [self.showView addSubview:popTable];

}

- (void)tap:(UITapGestureRecognizer *)tap{
    [self.backView removeFromSuperview];
    [self.showView removeFromSuperview];
    [self removeFromSuperview];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.arry[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sendStrBlock) {
        self.sendStrBlock(self.arry[indexPath.row], indexPath.row);
    }
    [self.backView removeFromSuperview];
    [self.showView removeFromSuperview];
    [self removeFromSuperview];
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}


@end











