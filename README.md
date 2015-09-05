KCLaunchImage
=======================================
## Demo
[Video Demo]( http://youtu.be/BcXP814WxGQ)

## Description

A view controller which displays the launch image like Zhi Hu Daily.

## Installation

1. Insert `pod 'KCLaunchImage'` into your `Podfile`.
2. Type command `pod install` in your terminal.
3. Done.

## Add to your project

1. Add `KCLaunchImageViewController.h` and `KCLaunchImageViewController.m` into your project（if you install it from pod, just skip this step).
2. Create a new folder named `FakeLaunchImage` under `Images.xcassets`.
3. Create 4 kind of image sets:
	* `FakeLaunchImage-320w-480h@2x` (iPhone4)
	* `FakeLaunchImage-320w-568h@2x` (iPhone5)
	* `FakeLaunchImage-375w-667h@2x` (iPhone6)
	* `FakeLaunchImage-414w-736h@3x` (iPhone6P)
	
4. Put one specific image for each image set
![image](http://ww3.sinaimg.cn/large/5f581355gw1evrebdsgagj210b0moady.jpg)

5. Add your own launch image into `LaunchImage`.
6. Add your own display image named `displayImage`(same as `FakeLaunchImage`).
7. In your `AppDelegate.m` file, add those code.

```objective-c
\#import "KCLaunchImageViewController.h"
\#import "UIImage+ForiPhone.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIImageView *splashScreen = [[UIImageView alloc] initWithImage:[UIImage autoSelectImageWithImageName:@"FakeLaunchImage"]];
    [self.window addSubview:splashScreen];
    
    self.window.rootViewController =
    [KCLaunchImageViewController addTransitionToViewController:[[KCViewController alloc] init]
                                          modalTransitionStyle:UIModalTransitionStyleCrossDissolve
                                                     withImageName:@"DisplayImage"
                                                     taskBlock:^(void){
                                                         [splashScreen removeFromSuperview];
                                                     }];
    return YES;
}
```

## Resource File

The files should be open in [Sketch](http://bohemiancoding.com/sketch/)

## Attention
If your images shored in `images.xcassets` , please set `Deployment Target` >= 7.0. 

## Author

kavichen, chen1qi2wei3@gmail.com

## License

KCLaunchImage is available under the MIT license. See the LICENSE file for more info.


