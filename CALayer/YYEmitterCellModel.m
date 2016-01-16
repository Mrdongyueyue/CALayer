//
//  YYEmitterCellModel.m
//  CALayer
//
//  Created by hdf on 16/1/4.
//  Copyright © 2016年 董知樾. All rights reserved.
//

#import "YYEmitterCellModel.h"
#import "MJExtension.h"
#import <QuartzCore/QuartzCore.h>

@implementation YYEmitterCellModel

+ (NSDictionary *)objectClassInArray {
    return @{@"emitterCells":[self class]};
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //default
        self.enabled = NO;
        self.birthRate = 0;
        self.lifetime = 0;
        self.lifetimeRange = 0;
        self.emissionLatitude = 0;
        self.emissionLongitude = 0;
        self.emissionRange = 0;
        self.velocity = 0;
        self.velocityRange = 0;
        self.xAcceleration = 0;
        self.yAcceleration = 0;
        self.zAcceleration = 0;
        self.scale = 0;
        self.scaleRange = 0;
        self.scaleSpeed = 0;
        self.spin = 0;
        self.spinRange = 0;
        self.color = [UIColor whiteColor].CGColor;
        self.redRange = 0;
        self.greenRange = 0;
        self.blueRange = 0;
        self.alphaRange = 0;
        self.redSpeed = 0;
        self.greenSpeed = 0;
        self.blueSpeed = 0;
        self.alphaSpeed = 0;
        self.contents = nil;
        self.contentsRect = CGRectMake(0, 0, 1, 1);
        self.contentsScale = 1;
        self.minificationFilter = kCAFilterLinear;
        self.magnificationFilter = kCAFilterTrilinear;
        self.minificationFilterBias = 0;
        self.style = nil;
        /*
         + (instancetype)emitterCell;
         
         Emitter cells implement the same property model as defined by CALayer. See CALayer.h for more details.
         Emitter cells 实现相同的属性模型定义在CALayer中.更多细节见CALayer.h.
         + (nullable id)defaultValueForKey:(NSString *)key;
         - (BOOL)shouldArchiveValueForKey:(NSString *)key;
         
         The name of the cell. Used to construct key paths. Defaults to nil.
         cell的名字 用于构造关键路径
         @property(nullable, copy) NSString *name;
         
         Controls whether or not cells from this emitter are rendered.
         控制来自这个发射器的cell是否被渲染
         @property(getter=isEnabled) BOOL enabled;
         
         The number of emitted objects created every second. Default value is zero. Animatable.
         每秒发射的对象的数目.默认值为零.
         @property float birthRate;
         
         The lifetime of each emitted object in seconds, specified as a mean value and a range about the mean. Both values default to zero. Animatable.
         每个被发射对象的寿命为lifetime秒,指定作为一个平均值和一个范围内的平均值
         @property float lifetime;
         @property float lifetimeRange;
         
         The orientation of the emission angle in radians, relative to the natural orientation angle of the emission shape. Note that latitude here is what is typically called colatitude, the zenith or phi, the angle from the z-axis. Similarly longitude is the angle in the xy-plane from the x-axis, often referred to as the azimuth or theta. Both values default to zero, which translates to no change relative to the emission shape's direction. Both values are animatable.
         有发射角度(弧度制)确定方向弧度制,相对于发射方位角的自然形状.注意，这里的纬度是什么,是通常被称为余纬，极点或phi，从Z轴的角度.同样的经度是从x轴的XY平面的角度，通常被称为方位或θ.这两个值的默认值为零，这意味着对于发射形状的方向没有变化.两个值可以做动画
         @property CGFloat emissionLatitude;
         @property CGFloat emissionLongitude;
         
         An angle (in radians) defining a cone around the emission angle. Emitted objects are uniformly distributed across this cone. Defaults to zero.  Animatable.
         是一个角度（弧度）,发射角度来定义一个圆锥.发射的对象均匀分布在这个圆锥.默认为零.
         @property CGFloat emissionRange;
         
         The initial mean velocity of each emitted object, and its range. Both values default to zero. Animatable.
         每个发射的对象的初始平均速度，和它的范围.
         @property CGFloat velocity;
         @property CGFloat velocityRange;
         
         The acceleration vector applied to emitted objects. Defaults to (0, 0, 0). Animatable.
         确定发射对象的加速度矢量
         @property CGFloat xAcceleration;
         @property CGFloat yAcceleration;
         @property CGFloat zAcceleration;
         
         The scale factor applied to each emitted object, defined as mean and range about the mean. Scale defaults to one, range to zero. Animatable.
         缩放比例 适用于每个发射对象,定义为平均值和平均范围,scale default 0 ,
         @property CGFloat scale;
         @property CGFloat scaleRange;
         @property CGFloat scaleSpeed;
         
         The rotation speed applied to each emitted object, defined as mean and range about the mean. Defaults to zero. Animatable. *
         旋转速度 适用于每个发射对象,定义为平均值和平均范围
         @property CGFloat spin;
         @property CGFloat spinRange;
         
         * The mean color of each emitted object, and the range from that mean color. `color' defaults to opaque white, `colorRange' to (0, 0, 0, 0). Animatable. *
         每一个发射物体的平均颜色，以及这个颜色的范围.颜色默认为不透明白色`colorRange'（0，0，0，0）
         @property(nullable) CGColorRef color;
         
         @property float redRange;
         @property float greenRange;
         @property float blueRange;
         @property float alphaRange;
         
         * The speed at which color components of emitted objects change over their lifetime, defined as the rate of change per second. Defaults to (0, 0, 0, 0). Animatable. *
         所发射的对象在其生命周期内颜色变化的速度，定义为每秒变化的速率
         @property float redSpeed;
         @property float greenSpeed;
         @property float blueSpeed;
         @property float alphaSpeed;
         
         * The cell contents, typically a CGImageRef. Defaults to nil. Animatable. *
         cell的内容 通常是CGImageRef类型的
         @property(nullable, strong) id contents;
         
         * The sub-rectangle of the contents image that will be drawn. See CALayer.h for more details. Defaults to the unit rectangle [0 0 1 1]. Animatable. *
         将绘制内容图像的子矩形.See CALayer.h for more details.Defaults to the unit rectangle [0 0 1 1](单元矩形).
         @property CGRect contentsRect;
         
         * Defines the scale factor applied to the contents of the cell. See CALayer.h for more details. *
         内容缩放比例
         @property CGFloat contentsScale;
         
         * The filter parameters used when rendering the `contents' image. See CALayer.h for more details. *
         滤波器的参数用于渲染内容图像
         @property(copy) NSString *minificationFilter;
         @property(copy) NSString *magnificationFilter;
         @property float minificationFilterBias;
         
         * An array containing the sub-cells of this cell, or nil (the default value). When non-nil each particle emitted by the cell will act as an emitter for each of the cell's sub-cells. The emission point is the current particle position and the emission angle is relative to the current direction of the particle. Animatable. *
         这个cell包含的子cell的数组,default nil . !nil时每一个由发射器发射的cell将作为其子cells的发射器(每一个cell将作为发射器发射emitterCells),发射点是当前粒子的位置,方向为:发射角相对于粒子的当前方向
         @property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;
         
         Inherited attributes similar to in layers.
         类似于层的继承属性
         @property(nullable, copy) NSDictionary *style;
         */

        /*
         @property(nonatomic, copy) NSString *name;
         
         @property(nonatomic , assign ,getter=isEnabled) BOOL enabled;
         
         @property (nonatomic , assign)float birthRate;
         
         @property (nonatomic , assign)float lifetime;
         @property (nonatomic , assign)float lifetimeRange;
         
         @property (nonatomic , assign)CGFloat emissionLatitude;
         @property (nonatomic , assign)CGFloat emissionLongitude;
         
         @property (nonatomic , assign)CGFloat emissionRange;
         
         @property (nonatomic , assign)CGFloat velocity;
         @property (nonatomic , assign)CGFloat velocityRange;
         
         @property (nonatomic , assign)CGFloat xAcceleration;
         @property (nonatomic , assign)CGFloat yAcceleration;
         @property (nonatomic , assign)CGFloat zAcceleration;
         
         @property (nonatomic , assign)CGFloat scale;
         @property (nonatomic , assign)CGFloat scaleRange;
         @property (nonatomic , assign)CGFloat scaleSpeed;
         
         @property (nonatomic , assign)CGFloat spin;
         @property (nonatomic , assign)CGFloat spinRange;
         
         @property (nullable , nonatomic , assign) CGColorRef color;
         
         @property (nonatomic , assign)float redRange;
         @property (nonatomic , assign)float greenRange;
         @property (nonatomic , assign)float blueRange;
         @property (nonatomic , assign)float alphaRange;
         
         @property (nonatomic , assign)float redSpeed;
         @property (nonatomic , assign)float greenSpeed;
         @property (nonatomic , assign)float blueSpeed;
         @property (nonatomic , assign)float alphaSpeed;
         
         @property (nullable, strong) id contents;
         
         @property (nonatomic , assign)CGRect contentsRect;
         
         @property (nonatomic , assign)CGFloat contentsScale;
         
         @property(nonatomic ,copy) NSString *minificationFilter;
         @property(nonatomic ,copy) NSString *magnificationFilter;
         @property (nonatomic , assign)float minificationFilterBias;
         
         @property(nonatomic ,nullable, copy) NSArray<CAEmitterCell *> *emitterCells;
         
         @property(nonatomic ,nullable, copy) NSDictionary *style;
         */
    }
    return self;
}

@end
