//
//  CAEmitterLayerType.m
//  CALayer
//
//  Created by Lqq on 16/1/1.
//  Copyright © 2016年 董知樾. All rights reserved.
//

#import "CAEmitterLayerType.h"

@interface CAEmitterLayerType ()

@property (nonatomic , weak)CAEmitterLayer *emitterLayer;

@end

@implementation CAEmitterLayerType

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCAEmitterLayer];
}

- (void)addCAEmitterLayer{
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    
    emitterLayer.bounds = CGRectMake(0, 0, 300, 300);
    emitterLayer.position = CGPointMake(300, 400);
    
//    emitterLayer.birthRate = 0;
    emitterLayer.lifetime = 10;
//    emitterLayer.emitterPosition = CGPointZero;
//    emitterLayer.emitterZPosition = 0;
    emitterLayer.emitterSize = CGSizeMake(10, 10);
    emitterLayer.emitterDepth = 5;
    
    /*
     `emitterShape' values.
     CA_EXTERN NSString * const kCAEmitterLayerPoint
     CA_EXTERN NSString * const kCAEmitterLayerLine
     CA_EXTERN NSString * const kCAEmitterLayerRectangle
     CA_EXTERN NSString * const kCAEmitterLayerCuboid
     CA_EXTERN NSString * const kCAEmitterLayerCircle
     CA_EXTERN NSString * const kCAEmitterLayerSphere
     
     `emitterMode' values.
     CA_EXTERN NSString * const kCAEmitterLayerPoints
     CA_EXTERN NSString * const kCAEmitterLayerOutline
     CA_EXTERN NSString * const kCAEmitterLayerSurface
     CA_EXTERN NSString * const kCAEmitterLayerVolume
     
     `renderMode' values.
     CA_EXTERN NSString * const kCAEmitterLayerUnordered
     CA_EXTERN NSString * const kCAEmitterLayerOldestFirst
     CA_EXTERN NSString * const kCAEmitterLayerOldestLast
     CA_EXTERN NSString * const kCAEmitterLayerBackToFront
     CA_EXTERN NSString * const kCAEmitterLayerAdditive
     */
    
    emitterLayer.emitterShape = kCAEmitterLayerSphere;
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    emitterLayer.preservesDepth = YES;
    emitterLayer.velocity = 5;
    emitterLayer.scale = 0.5;
    emitterLayer.spin = 1;
    emitterLayer.seed = 1;
    
    
    CAEmitterCell *orangeCell = [CAEmitterCell emitterCell];
    orangeCell.color = [UIColor whiteColor].CGColor;
    orangeCell.lifetime = 2;
    orangeCell.birthRate = 100;
    orangeCell.alphaSpeed = 1;
    orangeCell.velocity = 100;
    orangeCell.velocityRange = 200;
    orangeCell.emissionRange = M_PI * .5;

    orangeCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"chrome"].CGImage);

    emitterLayer.emitterCells = @[orangeCell];
    
    
    [self.view.layer addSublayer:emitterLayer];
    _emitterLayer = emitterLayer;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_emitterLayer removeFromSuperlayer];
}

/*
 * The array of emitter cells attached to the layer. Each object must
 * have the CAEmitterCell class. *

@property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;

* The birth rate of each cell is multiplied by this number to give the
 * actual number of particles created every second. Default value is one.
 * Animatable. *

@property float birthRate;

* The cell lifetime range is multiplied by this value when particles are
 * created. Defaults to one. Animatable. *

@property float lifetime;

* The center of the emission shape. Defaults to (0, 0, 0). Animatable. *

@property CGPoint emitterPosition;
@property CGFloat emitterZPosition;

* The size of the emission shape. Defaults to (0, 0, 0). Animatable.
 * Depending on the `emitterShape' property some of the values may be
 * ignored. *

@property CGSize emitterSize;
@property CGFloat emitterDepth;

* A string defining the type of emission shape used. Current options are:
 * `point' (the default), `line', `rectangle', `circle', `cuboid' and
 * `sphere'. *

@property(copy) NSString *emitterShape;

* A string defining how particles are created relative to the emission
 * shape. Current options are `points', `outline', `surface' and
 * `volume' (the default). *

@property(copy) NSString *emitterMode;

* A string defining how particles are composited into the layer's
 * image. Current options are `unordered' (the default), `oldestFirst',
 * `oldestLast', `backToFront' (i.e. sorted into Z order) and
 * `additive'. The first four use source-over compositing, the last
 * uses additive compositing. *

@property(copy) NSString *renderMode;

* When true the particles are rendered as if they directly inhabit the
 * three dimensional coordinate space of the layer's superlayer, rather
 * than being flattened into the layer's plane first. Defaults to NO.
 * If true, the effect of the `filters', `backgroundFilters' and shadow-
 * related properties of the layer is undefined. *

@property BOOL preservesDepth;

* Multiplies the cell-defined particle velocity. Defaults to one.
 * Animatable. *

@property float velocity;

 Multiplies the cell-defined particle scale. Defaults to one. Animatable.

@property float scale;

 Multiplies the cell-defined particle spin. Defaults to one. Animatable.

@property float spin;

 The seed used to initialize the random number generator. Defaults to
 * zero. Each layer has its own RNG state. For properties with a mean M
 * and a range R, random values of the properties are uniformly
 * distributed in the interval [M - R/2, M + R/2].

@property unsigned int seed;



 `emitterShape' values.
 
CA_EXTERN NSString * const kCAEmitterLayerPoint
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerLine
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerRectangle
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerCuboid
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerCircle
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerSphere
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);

 `emitterMode' values.

CA_EXTERN NSString * const kCAEmitterLayerPoints
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerOutline
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerSurface
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerVolume
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);

 `renderMode' values.
 
CA_EXTERN NSString * const kCAEmitterLayerUnordered
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerOldestFirst
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerOldestLast
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerBackToFront
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
CA_EXTERN NSString * const kCAEmitterLayerAdditive
__OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_5_0);
 */

@end
