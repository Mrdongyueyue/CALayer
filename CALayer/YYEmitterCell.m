//
//  YYEmitterCell.m
//  CALayer
//
//  Created by hdf on 16/1/4.
//  Copyright © 2cellModel.enabled16年 董知樾. All rights reserved.
//

#import "YYEmitterCell.h"
#import "YYEmitterCellModel.h"

@interface YYEmitterCell ()

@property (nonatomic, strong) NSArray *emitterCellModels;

@end

@implementation YYEmitterCell

- (void)setCellModel:(YYEmitterCellModel *)cellModel{
    _cellModel = cellModel;
    
    self.enabled = cellModel.enabled;
    self.birthRate = cellModel.birthRate;
    self.lifetime = cellModel.lifetime;
    self.lifetimeRange = cellModel.lifetimeRange;
    self.emissionLatitude = cellModel.emissionLatitude;
    self.emissionLongitude = cellModel.emissionLongitude;
    self.emissionRange = cellModel.emissionRange;
    self.velocity = cellModel.velocity;
    self.velocityRange = cellModel.velocityRange;
    self.xAcceleration = cellModel.xAcceleration;
    self.yAcceleration = cellModel.yAcceleration;
    self.zAcceleration = cellModel.zAcceleration;
    self.scale = cellModel.scale;
    self.scaleRange = cellModel.scaleRange;
    self.scaleSpeed = cellModel.scaleSpeed;
    self.spin = cellModel.spin;
    self.spinRange = cellModel.spinRange;
    self.color = cellModel.color;
    self.redRange = cellModel.redRange;
    self.greenRange = cellModel.greenRange;
    self.blueRange = cellModel.blueRange;
    self.alphaRange = cellModel.alphaRange;
    self.redSpeed = cellModel.redSpeed;
    self.greenSpeed = cellModel.greenSpeed;
    self.blueSpeed = cellModel.blueSpeed;
    self.alphaSpeed = cellModel.alphaSpeed;
    self.contents = cellModel.contents;
    self.contentsRect = cellModel.contentsRect;
    self.contentsScale = cellModel.contentsScale;
    self.minificationFilter = cellModel.minificationFilter;
    self.magnificationFilter = cellModel.magnificationFilter;
    self.minificationFilterBias = cellModel.minificationFilterBias;
    self.style = cellModel.style;
    self.emitterCellModels = cellModel.emitterCells;
    
    
}

- (void)setEmitterCellModels:(NSArray *)emitterCellModels {
    _emitterCellModels = emitterCellModels;
    if (emitterCellModels.count == 0) {
        return;
    }
    NSMutableArray *emCells = [NSMutableArray array];
    for (YYEmitterCellModel *model in emitterCellModels) {
        YYEmitterCell *cell = [YYEmitterCell emitterCell];
        cell.cellModel = model;
        cell.emitterCellModels = model.emitterCells;
        [emCells addObject:cell];
    }
    self.emitterCells = emCells;
}

@end
