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
- (void)emitterLayer:(YYEmitterLayer *)layer cellAtIndex:(NSUInteger)index keyPath:(NSString *)keyPath;


@end


@interface YYEmitterLayer : CAEmitterLayer

@property (nonatomic, weak) id<YYEmitterLayerDatasource> dataSource;
@property (nonatomic, weak) id<YYEmitterLayerDelegate> yy_delegate;

- (void)reloadData;

@end
