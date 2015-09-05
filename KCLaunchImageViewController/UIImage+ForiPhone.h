//
//  UIImage+ForiPhone.h
//  KCLaunchImageViewControllerDemo
//
//  Created by kavi chen on 15/9/5.
//  Copyright © 2015年 kavi chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSDeviceType.h"
#import "NSString+deviceSize.h"

@interface UIImage (ForiPhone)

+ (UIImage *)imageNamed:(NSString *)name
                 iPhone:(KCiPhoneDevice)device;

+ (UIImage *)autoSelectImageWithImageName:(NSString *)name;

@end
