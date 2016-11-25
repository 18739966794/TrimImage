//
//  ViewController.m
//  裁剪图片
//
//  Created by WP_YK on 16/6/17.
//  Copyright © 2016年 WP_YK. All rights reserved.
//

#import "ViewController.h"

#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenheight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIImageView *catImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *originalImage = [UIImage imageNamed:@"cat_image.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth/2-100, 50, 200, 200)];
    imageView.image = originalImage;
    [self.view addSubview:imageView];
    
    self.catImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth/2-100, 300, 100, 50)];
    self.catImageView.image = [self clipImage:originalImage InRect:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.catImageView];
    
    
    CGFloat proportion = self.catImageView.bounds.size.height/self.catImageView.bounds.size.width;
    
    CGFloat needHeight = originalImage.size.width*proportion;
    
    UIImage *needImage = [self clipImage:originalImage InRect:CGRectMake(0, (originalImage.size.height-needHeight)/2, originalImage.size.width, needHeight)];
    self.catImageView.image = needImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//截取图片的某一部分
- (UIImage *)clipImage:(UIImage *)image InRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}



@end
