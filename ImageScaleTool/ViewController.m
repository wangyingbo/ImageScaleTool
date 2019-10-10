//
//  ViewController.m
//  ImageScaleTool
//
//  Created by fengbang on 2019/10/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ViewController.h"
#import "YBItem.h"
#import "UIImageView+YBScale.h"


/**屏幕的宽和高*/
#define FULL_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define FULL_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define VIEWLAYOUT_W  KV_SCREEN_WIDTH/375
#define VIEWLAYOUT_H  (IS_IPHONEX?VIEWLAYOUT_W:KV_SCREEN_HEIGHT/667)
#define YBLAYOUT_W(w) w*VIEWLAYOUT_W//
#define YBLAYOUT_H(h) h*VIEWLAYOUT_H//
/**设置 view 圆角和边框*/
#define YBViewBorderRadius(View, radius, borderWidth, borderColor)\
\
[View.layer setCornerRadius:(radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(borderWidth)];\
[View.layer setBorderColor:[borderColor CGColor]];

CGFloat kImageViewWH = 100.f;


@interface ViewController ()
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configImageView];
    
    [self configData];
    
    [self configButtons];
}

#pragma mark - configData

- (void)configData {
    NSArray *arr = @[
                     YB_CREATE_ITEM(YBFunctionMaxWidth1, @"最大width-横图片"),
                     YB_CREATE_ITEM(YBFunctionMaxWidth2, @"最大width-竖图片"),
                     YB_CREATE_ITEM(YBFunctionMaxHeight1, @"最大height-横图片"),
                     YB_CREATE_ITEM(YBFunctionMaxHeight2, @"最大height-竖图片"),
                     YB_CREATE_ITEM(YBFunctionMaxSize1, @"最大size横图片"),
                     YB_CREATE_ITEM(YBFunctionMaxSize2, @"最大size竖图片"),
                     ];
    
    self.titleArray = arr;
}

#pragma mark - configUI

- (void)configNavigationUI {
    NSString *title = @"测试demo";
    self.title = title;
    self.navigationController.navigationItem.title = title;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)configImageView {
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(center.x - kImageViewWH/2, center.y - kImageViewWH/2, kImageViewWH, kImageViewWH)];
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.backgroundColor = [UIColor lightGrayColor];
    imageView.layer.borderWidth = 2;
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

- (void)configButtons {
    UIButton *lastButton;
    CGFloat leftMargin = 25.f;
    CGFloat rightMargin = 25.f;
    CGFloat topMargin = 64 + 50.f;//第一行与父视图的上边距
    CGFloat space_horizontal = 20.f;//列间距
    CGFloat space_vertical = 20.f;//行间距
    
    for (int i=0;i<self.titleArray.count;i++) {
        YBItem *item = self.titleArray[i];
        UIButton *button = [[UIButton alloc] init];
        [self.view addSubview:button];
        YBViewBorderRadius(button, 10, .8, [UIColor colorWithRed:(0/255.0) green:(116/255.0) blue:(243/255.0) alpha:1])
        button.tag = item.tag.integerValue;
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        [button setTitle:item.name?:@"" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:(0/255.0) green:(116/255.0) blue:(243/255.0) alpha:1] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGSize buttonSize = [button sizeThatFits:CGSizeMake(FULL_SCREEN_WIDTH-leftMargin-rightMargin, MAXFLOAT)];
        buttonSize = CGSizeMake(buttonSize.width+15, buttonSize.height+2);
        if (item.width>1e-6) {
            buttonSize = CGSizeMake(item.width, buttonSize.height);
        }
        CGFloat button_x = leftMargin;
        CGFloat button_y = topMargin;
        if (lastButton) {
            CGFloat button_max_x = CGRectGetMaxX(lastButton.frame)+space_horizontal+buttonSize.width+rightMargin;
            button_x = (button_max_x<=FULL_SCREEN_WIDTH)?(CGRectGetMaxX(lastButton.frame)+space_horizontal):leftMargin;
            button_y = (button_max_x<=FULL_SCREEN_WIDTH)?(CGRectGetMinY(lastButton.frame)):CGRectGetMaxY(lastButton.frame)+space_vertical;
        }
        button.frame = CGRectMake(button_x, button_y, buttonSize.width, buttonSize.height);
        
        lastButton = button;
    }
}

#pragma mark - actions
- (void)buttonClick:(UIButton *)sender {
    
    CGSize fitSize = self.imageView.frame.size;
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    
    if (self.imageView.image) {
        fitSize = CGSizeMake(kImageViewWH, kImageViewWH);
        self.imageView.image = nil;
        self.imageView.frame = CGRectMake(center.x-fitSize.width/2, center.y-fitSize.height/2, fitSize.width, fitSize.height);
        return;
    }
    
    switch (sender.tag) {
        case YBFunctionMaxWidth1:
        {
            fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"h_pic"] maxWidth:250];
        }
            break;
        case YBFunctionMaxWidth2:
        {
            fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"v_pic"] maxWidth:250];
        }
            break;
        case YBFunctionMaxHeight1:
        {
            fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"h_pic"] maxHeight:200.f];
        }
            break;
        case YBFunctionMaxHeight2:
        {
            fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"v_pic"] maxHeight:200.f];
        }
            break;
        case YBFunctionMaxSize1:
        {
            fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"h_pic"] maxSize:CGSizeMake(300, 200)];
        }
            break;
        case YBFunctionMaxSize2:
        {
            fitSize = [self.imageView yb_fitImage:[UIImage imageNamed:@"v_pic"] maxSize:CGSizeMake(300, 200)];
        }
            break;
            
        default:
            break;
    }
    
    self.imageView.frame = CGRectMake(center.x-fitSize.width/2, center.y-fitSize.height/2, fitSize.width, fitSize.height);
}

@end
