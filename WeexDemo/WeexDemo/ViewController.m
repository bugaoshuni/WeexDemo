//
//  ViewController.m
//  WeexDemo
//
//  Created by hjc on 2017/1/16.
//  Copyright © 2017年 hehe. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WeexSDK.h>

@interface ViewController ()
//一个WXSDKInstance对应一个weex页面，用来渲染页面。一般通过renderWithURL方法。
@property (nonatomic, readwrite, strong) WXSDKInstance *instance;
@property (nonatomic, weak) UIView *weexView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addTestBtn];
    
    //默认加载的地址为本地路径的bundlejs/index.js
    if (!self.url) {
        self.url = [[NSBundle mainBundle] pathForResource:@"helloWeex" ofType:@"js"];
    }
    //weex将js渲染成weex页面。
    [self render];
}

- (void)addTestBtn {
    //在self.view上添加一个原生的按钮
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 200, 100)];
    testButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testButton];
    [testButton setTitle:@"原生button-test" forState:UIControlStateNormal];
    [testButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void)render {
    NSURL *URL = [[NSURL alloc] initFileURLWithPath:self.url];
    
    CGFloat width = self.view.frame.size.width;
    //首先在ViewController里的render放初始化WXSDKInstance，因为render会支持实时刷新，所以每次都需要先销毁这个实例。
    [_instance destroyInstance];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(self.view.frame.size.width-width, 500, width, self.view.frame.size.height);
    
    __weak typeof(self) weakSelf = self;
    
    _instance.onCreate = ^(UIView *view) {
        //onCreate:根视图rootView创建的时候
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    self.instance.onFailed = ^(NSError *error){
        //处理失败后
        NSLog(@"onFailed:%@",error.userInfo);
    };
   
    self.instance.renderFinish = ^(UIView *view){
        //处理页面渲染完成
        NSLog(@"renderFinish:%@",view);
//        [weakSelf.instance fireGlobalEvent:@"geolocation" params:@{@"key":@"value"}];
    };
    
    NSString *randomURL = [NSString stringWithFormat:@"%@?random=%d",URL.absoluteString,arc4random()];
    //调用renderWithURL方法来载入script,js可以是本地文件或者从服务器下载。
    [self.instance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":URL.absoluteString} data:nil];
}

- (void)dealloc{
    //destroyInstanc 销毁 weex 实例，不然会内存溢出
    [self.instance destroyInstance];
}

@end
