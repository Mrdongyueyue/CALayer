//
//  YYViewController.h
//  CALayer
//
//  Created by hdf on 15/12/31.
//  Copyright © 2015年 董知樾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYViewController : UIViewController

@property (nonatomic, copy) NSString *layerType;

CA_EXTERN NSString * const CALayerType;
CA_EXTERN NSString * const CATextLayerType;
CA_EXTERN NSString * const CAShapeLayerType;
CA_EXTERN NSString * const CATiledLayerType;
CA_EXTERN NSString * const CAGradientLayerType;

@end
