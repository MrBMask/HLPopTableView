//
//  ViewController.m
//  HLPopTableView
//
//  Created by 郝靓 on 2018/6/13.
//  Copyright © 2018年 郝靓. All rights reserved.
//

#define WINDOW [[[UIApplication sharedApplication] delegate] window]


#import "ViewController.h"
#import "HLPopTableView.h"
#import "UIView+HLExtension.h"


@interface ViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 80, 40)];
    button.center = self.view.center;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(processButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"点击" forState:UIControlStateNormal];
    [button1 setFrame:CGRectMake(300, 500, 80, 40)];
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(processButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"点击" forState:UIControlStateNormal];
    [button2 setFrame:CGRectMake(100, 700, 80, 40)];
 
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(processButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sigleTappedPickerView:)];
    [singleTap setNumberOfTapsRequired:1];
    singleTap.delegate = self;
    [self.view addGestureRecognizer:singleTap];
    
}
- (void)sigleTappedPickerView:(UIGestureRecognizer *)sender

{
    
    //取得所点击的点的坐标
    
    CGPoint point = [sender locationInView:self.view];
    NSLog(@"touch (x, y) is (%f, %f)", point.x,point.y);
    
}




- (void)processButton:(UIButton *)sender{
    
   
    NSArray * arr = @[@"北京",@"上海",@"天津",@"广州",@"深圳",@"浙江",@"杭州",@"丽江"];
    HLPopTableView * hlPopView = [HLPopTableView initWithFrame:CGRectMake(0, 0, sender.width, 200) dependView:sender textArr:arr block:^(NSString *region_name, NSInteger index) {
        
    }];
    [self.view addSubview:hlPopView];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSSet * allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
//    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
//    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
//    int x = point.x;
//    int y = point.y;
//    NSLog(@"touch (x, y) is (%d, %d)", x, y);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
