//
//  KCLaunchImageViewController.m
//  FakeZhiHuDailyLaunchImageTransition
//
//  Created by kavi chen on 14-4-15.
//  Copyright (c) 2014年 kavi chen. All rights reserved.
//

#import "KCLaunchImageViewController.h"


@interface KCLaunchImageViewController ()
@property (nonatomic,strong) UIImage * myImage;
@property (nonatomic,strong) id viewController;
@property (nonatomic,strong) UIImageView *fromImageView;
@property (nonatomic,strong) UIImageView *toImageView;
@property (nonatomic,strong) UIImageView *maskImageView;

@end

@implementation KCLaunchImageViewController
@synthesize myImage = _myImage;

+ (instancetype)addTransitionToViewController:(id)viewController
                         modalTransitionStyle:(UIModalTransitionStyle)theStyle
                                withImageName:(NSString *)imageName
                                    taskBlock:(void (^)(void))block
{
    return [[self alloc] initWithViewController:viewController
                           modalTransitionStyle:theStyle
                                      imageName:imageName
                                      taskBlock:block];
}

+ (instancetype)addTransitionToViewController:(id)viewController
                         modalTransitionStyle:(UIModalTransitionStyle)theStyle
                                withImageData:(UIImage *)imageData
                                    taskBlock:(void (^)(void))block
{
    return [[self alloc] initWithViewController:viewController
                           modalTransitionStyle:theStyle
                                      imageData:imageData
                                      taskBlock:block];
}

- (instancetype)initWithViewController:(id)viewController
                  modalTransitionStyle:(UIModalTransitionStyle)theStyle
                             imageData:(UIImage *)imageData
                             taskBlock:(void (^)(void))block
{
    self = [super init];
    if (self) {
        [viewController setModalTransitionStyle:theStyle];
        self.myImage = [imageData copy];
        self.viewController = viewController;
        block();
    }
    return self;
}

- (instancetype)initWithViewController:(id)viewController
                  modalTransitionStyle:(UIModalTransitionStyle)theStyle
                             imageName:(NSString *)imageName
                             taskBlock:(void (^)(void))block

{
    self = [super init];
    if (self) {
        [viewController setModalTransitionStyle:theStyle];
        self.myImage = [UIImage autoSelectImageWithImageName:imageName];
        self.viewController = viewController;
        if (block) {
          block();
        }
    }
    return self;
}

- (BOOL)prefersStatusBarHidden
{
    return STATUS_BAR_HIDDEN;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    self.fromImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.toImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.maskImageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.fromImageView.image = [UIImage autoSelectImageWithImageName:@"FakeLaunchImage"];
    [self.view addSubview:self.fromImageView];
    
    self.maskImageView.image = [UIImage autoSelectImageWithImageName:@"MaskImage"];
    [self.view insertSubview:self.maskImageView belowSubview:self.fromImageView];
    
    self.toImageView.image = self.myImage;
    [self.view insertSubview:self.toImageView belowSubview:self.maskImageView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:TRANSITION_DURATION];
        [self.fromImageView setAlpha:0.0f];
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        CGAffineTransform transform = CGAffineTransformMakeScale(XSCALE, YSCALE);
        self.toImageView.transform = transform;
        [UIView commitAnimations];
        
        [NSTimer scheduledTimerWithTimeInterval:ANIMATION_DURATION
                                         target:self
                                       selector:@selector(presentNextViewController:)
                                       userInfo:self.viewController
                                        repeats:NO];
    });
}

- (void)presentNextViewController:(NSTimer *)timer
{
    [self presentViewController:[timer userInfo]
                       animated:YES
                     completion:nil];
}


@end
