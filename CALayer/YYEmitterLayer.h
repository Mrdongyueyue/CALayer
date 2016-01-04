//
//  YYEmitterLayer.h
//  CALayer
//
//  Created by hdf on 16/1/4.
//  Copyright © 2016年 董知樾. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class YYEmitterLayer;

@protocol YYEmitterLayerDatasource <NSObject>
- (CAEmitterCell *)emitterLayer:(YYEmitterLayer *)layer cellAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfCells;
@end

@protocol YYEmitterLayerDelegate <NSObject>
@optional

@end


@interface YYEmitterLayer : CAEmitterLayer

@property (nonatomic, weak) id<YYEmitterLayerDatasource> dataSource;
- (void)reloadData;

@end
