//
//  KCLaunchImageViewController.h
//  FakeZhiHuDailyLaunchImageTransition
//
//  Created by kavi chen on 14-4-15.
//  Copyright (c) 2014年 kavi chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DURATION 6.0
#define XSCALE 1.3
#define YSCALE 1.3


@interface KCLaunchImageViewController : UIViewController

+ (instancetype)addTransitionToViewController:(id)viewController
                         modalTransitionStyle:(UIModalTransitionStyle)theStyle
                                    withImage:(NSString *)imageName;

@end
