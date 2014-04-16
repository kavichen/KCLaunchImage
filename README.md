Fake-ZhiHu-Daily-LaunchImage-Transition
=======================================
## Usage

1. Add `KCLaunchImageViewController.h` and `KCLaunchImageViewController.m` into your project
2. Add your first LaunchImage into your Project(e.g default launch image)
3. In your `AppDelegate.m` file, add those code

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController =
    [KCLaunchImageViewController addTransitionToViewController:[[KCViewController alloc] init]
                                          modalTransitionStyle:UIModalTransitionStyleCrossDissolve
                                                     withImage:@"Hepburn"];
    
    return YES;
}
});
```

 