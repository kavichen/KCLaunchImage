//
//  NSString+deviceSize.m
//  KCLaunchImageViewControllerDemo
//
//  Created by kavi chen on 15/9/5.
//  Copyright © 2015年 kavi chen. All rights reserved.
//

#import "NSString+deviceSize.h"

@implementation NSString (deviceSize)

+ (NSString *)iphone:(KCiPhoneDevice)device
{
    NSString *formattedName = nil;
    
    switch (device) {
        case KCiPhoneDeviceiPhone3: {
            formattedName = @"-320w-480h@1x";
            break;
        }
        case KCiPhoneDeviceiPhone4: {
            formattedName = @"-320w-480h@2x";
            break;
        }
        case KCiPhoneDeviceiPhone5: {
            formattedName = @"-320w-568h@2x";
            break;
        }
        case KCiPhoneDeviceiPhone6: {
            formattedName = @"-375w-667h@2x";
            break;
        }
        case KCiPhoneDeviceiPhone6p: {
            formattedName = @"-414w-736h@3x";
            break;
        }
        default: {
            formattedName = @"";
            break;
        }
    }
    
    return formattedName;
}

@end
