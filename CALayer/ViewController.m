//
//  ViewController.m
//  CALayer
//
//  Created by hdf on 15/12/31.
//  Copyright © 2015年 董知樾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) NSArray *array;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *peekIndexPath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = NSStringFromCGRect(self.view.bounds);
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUp3DTouch];
}

- (void)setUp3DTouch {
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSString *str in @[@"CATiledLayerType",@"CAGradientLayerType",@"CAEmitterLayerType",@"CAReplicatorLayerType"]) {
            UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:str localizedTitle:str localizedSubtitle:@"three" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:nil];
            
            [arr addObject:item];
        }
        [UIApplication sharedApplication].shortcutItems = arr;
    }
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0) {
    CGRect rect = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    [previewingContext setSourceRect:rect];
    location.y -= 64;
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:location];
    _peekIndexPath = indexPath;
    NSLog(@"%@,%ld",NSStringFromCGPoint(location),(long)indexPath.row);
    NSString *classString = self.array[indexPath.row];
    Class class = NSClassFromString(classString);
    UIViewController *layerVC = (UIViewController *)[[class alloc]init];
    layerVC.title = classString;
    layerVC.view.backgroundColor = [UIColor whiteColor];
    return layerVC;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0) {
    NSString *classString = self.array[_peekIndexPath.row];
    Class class = NSClassFromString(classString);
    UIViewController *layerVC = (UIViewController *)[[class alloc]init];
    layerVC.title = classString;
    layerVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:layerVC animated:YES];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *item = [UIPreviewAction actionWithTitle:@"进入" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSString *classString = self.array[_peekIndexPath.row];
        previewViewController.title = classString;
        previewViewController.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:previewViewController animated:YES];
    }];
    
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"" style:UIPreviewActionStyleDestructive actions:@[item]];
    
    return @[group];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
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

@end