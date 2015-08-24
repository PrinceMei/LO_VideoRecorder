//
//  ViewController.m
//  LOVedioRecorder
//
//  Created by 肖野 on 15/8/22.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithRed:0.451 green:0.804 blue:0.388 alpha:1]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitle:@"开始录制视频" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(recordVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
 
    
//    NSURL *url = [NSURL URLWithString:@""];
    
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/Mike/Desktop/录音:录视频（肖野）/LOVedioRecorder/LOVedioRecorder/area.txt"];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", dic);
    
    

    
}


/**
 *  录制视频
 */

/**
 *  录制视频
 *
 *  @param sender <#sender description#>
 */
-(void)recordVideo:(UIButton *)sender
{
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    ipc.allowsEditing = YES;
    
    ipc.videoQuality = UIImagePickerControllerQualityTypeMedium;
    
    ipc.videoMaximumDuration = 30.0f;
    
    ipc.mediaTypes = [NSArray arrayWithObject:@"test.video"];
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  保存录制的视频
 */
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
    
    BOOL compatible = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([url path]);
    if (compatible) {
        UISaveVideoAtPathToSavedPhotosAlbum([url path], self, nil, NULL);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/**
 *  检测
 */
-(BOOL)videoRecordingAvailable
{
    //找到是否有录制资源
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return NO;
    }
    
    return [[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera] containsObject:@"test.video"];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(60.5, 43.5)];
    [starPath addLineToPoint: CGPointMake(65.79, 50.96)];
    [starPath addLineToPoint: CGPointMake(74.77, 53.52)];
    [starPath addLineToPoint: CGPointMake(69.06, 60.69)];
    [starPath addLineToPoint: CGPointMake(69.32, 69.73)];
    [starPath addLineToPoint: CGPointMake(60.5, 66.7)];
    [starPath addLineToPoint: CGPointMake(51.68, 69.73)];
    [starPath addLineToPoint: CGPointMake(51.94, 60.69)];
    [starPath addLineToPoint: CGPointMake(46.23, 53.52)];
    [starPath addLineToPoint: CGPointMake(55.21, 50.96)];
    [starPath closePath];
    [fillColor setFill];
    [starPath fill];
    [strokeColor setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
