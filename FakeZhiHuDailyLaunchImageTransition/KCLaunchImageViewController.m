//
//  KCLaunchImageViewController.m
//  FakeZhiHuDailyLaunchImageTransition
//
//  Created by kavi chen on 14-4-15.
//  Copyright (c) 2014年 kavi chen. All rights reserved.
//

#import "KCLaunchImageViewController.h"

@interface KCLaunchImageViewController ()
@end

@implementation KCLaunchImageViewController

+ (instancetype)addTransitionToViewController:(id)viewController
                         modalTransitionStyle:(UIModalTransitionStyle)theStyle
                                    withImage:(NSString *)imageName
{
    return [[self alloc] initWithViewController:viewController
                           modalTransitionStyle:theStyle
                                          image:imageName];
}

- (instancetype)initWithViewController:(id)viewController
                  modalTransitionStyle:(UIModalTransitionStyle)theStyle
                             image:(NSString *)imageName
{
    self = [super init];
    if (self) {
        
        [viewController setModalTransitionStyle:theStyle];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        imageView.image = [UIImage imageNamed:imageName];
        [self.view addSubview:imageView];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DURATION];
        CGAffineTransform transformIn = CGAffineTransformMakeScale(XSCALE, YSCALE);
        imageView.transform = transformIn;
        [UIView commitAnimations];
        
        [NSTimer scheduledTimerWithTimeInterval:DURATION
                                         target:self
                                       selector:@selector(presentNextViewController:)
                                       userInfo:viewController
                                        repeats:NO];
    }
    return self;
}

- (void)presentNextViewController:(NSTimer *)timer
{
    [self presentViewController:[timer userInfo] animated:YES completion:nil];
}


@end
