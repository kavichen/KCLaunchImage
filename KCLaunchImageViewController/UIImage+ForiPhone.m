//
//  UIImage+ForiPhone.m
//  KCLaunchImageViewControllerDemo
//
//  Created by kavi chen on 15/9/5.
//  Copyright © 2015年 kavi chen. All rights reserved.
//

#import "UIImage+ForiPhone.h"

@implementation UIImage (ForiPhone)

+ (UIImage *)imageNamed:(NSString *)name iPhone:(KCiPhoneDevice)device
{
    
    UIImage *image = nil;
    
    NSString *imageName = [NSString stringWithFormat:@"%@%@",name,[NSString iphone:device]];
    image = [UIImage imageNamed:imageName];
    
    return image;
}

+ (UIImage *)autoSelectImageWithImageName:(NSString *)name
{
    UIImage *image = nil;
    
    if (IS_IPHONE_4_OR_LESS) {
        image = [UIImage imageNamed:name iPhone:KCiPhoneDeviceiPhone4];
    }else if (IS_IPHONE_5){
        image = [UIImage imageNamed:name iPhone:KCiPhoneDeviceiPhone5];
    }else if (IS_IPHONE_6){
        image = [UIImage imageNamed:name iPhone:KCiPhoneDeviceiPhone6];
    }else if (IS_IPHONE_6P){
        image = [UIImage imageNamed:name iPhone:KCiPhoneDeviceiPhone6p];
    }else{
        image = [UIImage imageNamed:name];
    }
    
    return image;
}


@end
