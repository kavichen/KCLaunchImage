//
//  iOSDeviceType.h
//  KCLaunchImageViewControllerDemo
//
//  Created by kavi chen on 15/9/5.
//  Copyright © 2015年 kavi chen. All rights reserved.
//

#ifndef iOSDeviceType_h
#define iOSDeviceType_h

typedef NS_ENUM(NSUInteger, KCiPhoneDevice) {
    KCiPhoneDeviceiPhone3,
    KCiPhoneDeviceiPhone4,
    KCiPhoneDeviceiPhone5,
    KCiPhoneDeviceiPhone6,
    KCiPhoneDeviceiPhone6p,
};

#pragma mark -
#pragma mark - Screen Size

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#pragma mark -
#pragma mark Device type.
// Corresponds to "Targeted device family" in project settings
// Universal apps will return true for whichever device they're on.
// iPhone apps will return true for iPhone even if run on iPad.

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


#endif /* iOSDeviceType_h */
