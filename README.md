KCLaunchImage
=======================================
## Demo
[Video Demo]( http://youtu.be/BcXP814WxGQ)

## Description

A view controller which displays the launch image like Zhi Hu Daily.

## Installation

1. Insert `pod 'KCLaunchImage', '~> 0.0.2'` into your `Podfile`.
2. Type command `pod install` in your terminal.
3. Done.

## Add to your project

1. Add `KCLaunchImageViewController.h` and `KCLaunchImageViewController.m` into your project（if you install it from pod, just skip this step).
2. Create a new image set named `FakeLaunchImage`.
3. Add your own launch image into `LaunchImage` and `FakeLaunchImage` separately.
4. Add your own display image named `displayImage`.
5. In your `AppDelegate.m` file, add those code.

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIImageView *splashScreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FakeLaunchImage"]];
    [self.window addSubview:splashScreen];

    self.window.rootViewController =
    [KCLaunchImageViewController addTransitionToViewController:[[KCViewController alloc] init]
                                          modalTransitionStyle:UIModalTransitionStyleCrossDissolve
                                                     withImage:@"displayImage" // your own display image
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


