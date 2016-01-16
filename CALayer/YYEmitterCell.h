//
//  YYEmitterCell.h
//  CALayer
//
//  Created by hdf on 16/1/4.
//  Copyright © 2016年 董知樾. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class YYEmitterCellModel;

@interface YYEmitterCell : CAEmitterCell

@property (nonatomic, strong) YYEmitterCellModel *cellModel;

@property (nonatomic, strong) NSArray *emitterCellModels;
@end
