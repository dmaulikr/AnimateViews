//
//  ViewController.m
//  Animation
//
//  Created by GNR solution PVT.LTD on 24/08/15.
//  Copyright (c) 2015 Harshavardhan Edke. All rights reserved.
//

#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)

#import "ViewController.h"
#import <stdlib.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    int currentViewTag;
    UIButton *btnContinue;
    UIButton *btnProfileDecision;
    UITableView *tblList;
    BOOL flag;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH-20, SCREEN_HEIGHT-120)];
//    view.backgroundColor = [UIColor colorWithHue:drand48() saturation:2.0 brightness:1.0 alpha:1.0];
//    currentViewTag = arc4random_uniform(74);
//    view.tag = currentViewTag;
//    [self.view addSubview:view];
    
    btnContinue = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT- 50, 100, 50)];
    btnContinue.backgroundColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1.0];
    [btnContinue setTitle:@"Continue" forState:UIControlStateNormal];
    [btnContinue addTarget:self action:@selector(onContinue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnContinue];
    [self.view bringSubviewToFront:btnContinue];
    
    tblList = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH-20, SCREEN_HEIGHT-120)];
    tblList.backgroundColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1.0];
    [tblList setDelegate:self];
    [tblList setDataSource:self];
    [self.view addSubview:tblList];
    
    btnProfileDecision = [[UIButton alloc]initWithFrame:CGRectMake(-100, 70, 100, 40)];
    btnProfileDecision.backgroundColor = [UIColor blackColor];
    [btnProfileDecision setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnProfileDecision setTitle:@"Status" forState:UIControlStateNormal];
    [self.view addSubview:btnProfileDecision];
}

//-(void)onContinue:(UIButton *)sender{
//    
//    for (UIView *view in self.view.subviews) {
//        if (view.tag == currentViewTag) {
//          
//            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//                view.frame = CGRectMake(SCREEN_WIDTH/2, -SCREEN_HEIGHT, 0, 0);
//            } completion:^(BOOL finished) {
//                [view removeFromSuperview];
//            }];
//        }
//    }
//    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(320, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-120)];
//    [view setTransform:CGAffineTransformRotate(view.transform, M_PI_2*0.5)];
//    view.backgroundColor = [UIColor colorWithHue:drand48() saturation:2.0 brightness:1.0 alpha:1.0];
//    currentViewTag = arc4random_uniform(74);
//    view.tag = currentViewTag;
//    [self.view addSubview:view];
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        [view setTransform:CGAffineTransformRotate(view.transform, -M_PI_2*0.5)];
//        view.frame = CGRectMake(10, 70, SCREEN_WIDTH-20, SCREEN_HEIGHT-120);
//    } completion:^(BOOL finished) {
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//        [animation setDuration:0.05];
//        [animation setRepeatCount:1];
//        [animation setAutoreverses:YES];
//        [animation setFromValue:[NSValue valueWithCGPoint:
//                                 CGPointMake([view center].x - 20.0f, [view center].y)]];
//        [animation setToValue:[NSValue valueWithCGPoint:
//                               CGPointMake([view center].x + 20.0f, [view center].y)]];
//        [[view layer] addAnimation:animation forKey:@"position"];
//    }];
//}

-(void)onContinue:(UIButton *)sender{
    if (!flag) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            btnProfileDecision.frame = CGRectMake(SCREEN_WIDTH/2, -SCREEN_HEIGHT, 0, 0);
        } completion:^(BOOL finished) {
            btnProfileDecision.frame = CGRectMake(SCREEN_WIDTH - 150, 150, 100, 30);
            [btnProfileDecision setTransform:CGAffineTransformRotate(btnProfileDecision.transform, -M_PI_2*0.5)];
        }];
        flag = YES;
    }
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

#pragma mark - UITableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    cell.backgroundColor = [UIColor colorWithHue:drand48() saturation:2.0 brightness:1.0 alpha:1.0];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
