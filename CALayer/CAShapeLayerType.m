//
//  CAShapeLayerType.m
//  CALayer
//
//  Created by Lqq on 16/1/1.
//  Copyright © 2016年 董知樾. All rights reserved.
//

#import "CAShapeLayerType.h"

@interface CAShapeLayerType ()

@end

@implementation CAShapeLayerType

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLayerFromBezierPath];
    
}

/** 贝塞尔曲线 */
- (void)addLayerFromBezierPath{
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(10, 20)];
    [bezierPath addCurveToPoint:CGPointMake(200, 300) controlPoint1:CGPointMake(5, 0) controlPoint2:CGPointMake(200, 0)];
    bezierPath.lineWidth = 2;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = nil;
    
    //根据bezierPath 获取 CAShapeLayer
    CGPathRef pathRef = CGPathCreateCopyByStrokingPath(shapeLayer.path, NULL, bezierPath.lineWidth, kCGLineCapRound, kCGLineJoinRound, shapeLayer.miterLimit);
    //获取 路径的范围CGPathGetBoundingBox()
    shapeLayer.bounds = CGPathGetBoundingBox(pathRef);
    CGPathRelease(pathRef);
    
    UIView *markView = [[UIView alloc]initWithFrame:CGRectMake(100, 150, 2, 2)];
    markView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:markView];
    
    [self.view.layer addSublayer:shapeLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
