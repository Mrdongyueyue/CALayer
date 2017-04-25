//
//  ViewController.m
//  CALayer
//
//  Created by hdf on 15/12/31.
//  Copyright © 2015年 董知樾. All rights reserved.
//

#import "ViewController.h"
#import "YYFPSLabel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) NSArray *array;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBInspectable NSNumber *color;
@property (nonatomic, strong) IBInspectable UIImage *image;
@property (nonatomic, strong) IBInspectable UIColor *bcolor;
@end


@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = _bcolor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUp3DTouch];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView.backgroundColor = _bcolor;
    
    YYFPSLabel *label = [[YYFPSLabel alloc] init];
    label.frame = CGRectMake(0, self.view.bounds.size.height - 40, 0, 0);
    [label sizeToFit];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
}

- (void)setUp3DTouch {
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSString *str in @[@"CATiledLayerType",@"CAGradientLayerType",@"CAEmitterLayerType",@"CAReplicatorLayerType"]) {
            UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:str localizedTitle:str localizedSubtitle:@"three" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:nil];
            
            [arr addObject:item];
        }
        [UIApplication sharedApplication].shortcutItems = arr;
    }
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0) {
    UITableViewCell *cell = (UITableViewCell *)[previewingContext sourceView];
    NSString *classString = cell.textLabel.text;
    Class class = NSClassFromString(classString);
    UIViewController *layerVC = (UIViewController *)[[class alloc]init];
    layerVC.title = classString;
    layerVC.view.backgroundColor = [UIColor whiteColor];
    return layerVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0) {
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
            [self registerForPreviewingWithDelegate:self sourceView:cell];
        }
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *classString = self.array[indexPath.row];
    Class class = NSClassFromString(classString);
    UIViewController *layerVC = (UIViewController *)[[class alloc]init];
    layerVC.title = classString;
    layerVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:layerVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSArray *)array{
    if (!_array) {
        _array = @[@"CALayerType",@"CATextLayerType",@"CAShapeLayerType",@"CATiledLayerType",@"CAGradientLayerType",@"CAEmitterLayerType",@"CAReplicatorLayerType",@"CAScrollLayerType",@"CATransformLayerType"];
    }
    return _array;
}
//github test
//github test 2
@end
