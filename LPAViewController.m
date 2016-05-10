//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;
@property (nonatomic, weak) UIView *                purpleBox;
@property (nonatomic, weak) NSLayoutConstraint *    purpleBoxHeight;
@property (nonatomic, weak) NSLayoutConstraint *    purpleBoxWidth;
@property (nonatomic, weak) NSLayoutConstraint *    purpleBoxRightMargin;
@property (nonatomic, weak) NSLayoutConstraint *    purpleBoxBottom;
@property (nonatomic, weak) UIView *                blueBox1;
@property (nonatomic, weak) NSLayoutConstraint *    blueBox1Height;
@property (nonatomic, weak) NSLayoutConstraint *    blueBox1Width;
@property (nonatomic, weak) UIView *                blueBox2;
@property (nonatomic, weak) NSLayoutConstraint *    blueBox2Height;
@property (nonatomic, weak) NSLayoutConstraint *    blueBox2Width;
@property (nonatomic, weak) UIView             *    blueBox3;
@property (nonatomic, weak) NSLayoutConstraint *    blueBox3Height;
@property (nonatomic, weak) NSLayoutConstraint *    blueBox3Width;
@property (nonatomic, weak) UIView             *    redBox;
@property (nonatomic, weak) NSLayoutConstraint *    redBoxHeight;
@property (nonatomic, weak) NSLayoutConstraint *    redBoxWidth;
@property (nonatomic, weak) NSLayoutConstraint *    redBoxTop;
@property (nonatomic, weak) NSLayoutConstraint *    redBoxRight;
@property (nonatomic, weak) UIView             *    orangeBox1;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox1Height;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox1Width;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox1Top;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox1Right;
@property (nonatomic, weak) UIView *                orangeBox2;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox2Height;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox2Width;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox2Top;
@property (nonatomic, weak) NSLayoutConstraint *    orangeBox2Left;




@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    // Set up your views and constraints here
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];
    self.purpleBox = purpleBox;
    
    NSLayoutConstraint *PurpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *PurpleBoxBottom = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *PurpleBoxHeight = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:50.0];
    
    NSLayoutConstraint *PurpleBoxWidth = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.framingView
                                                                      attribute:NSLayoutAttributeWidth
                                                                     multiplier:(305.0/500.0)
                                                                       constant:0];
    
    
    
    [self.framingView addConstraint:PurpleBoxRightMargin];
    [self.framingView addConstraint:PurpleBoxBottom];
    [self.framingView addConstraint:PurpleBoxHeight];
    [self.framingView addConstraint:PurpleBoxWidth];
    
    UIView *blueBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    
    [self.framingView addSubview:blueBox1];
    self.blueBox1 = blueBox1;
    
    NSLayoutConstraint *blueBox1Height = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueBox1Width = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50];
    
    NSLayoutConstraint *blueBox1Y = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0];
    
    NSLayoutConstraint *blueBox1X = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    
    [self.blueBox1 addConstraint:blueBox1Height];
    [self.blueBox1 addConstraint:blueBox1Width];
    [self.framingView addConstraint:blueBox1Y];
    [self.framingView addConstraint:blueBox1X];
    
    UIView *blueBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    
    [self.framingView addSubview:blueBox2];
    self.blueBox2 = blueBox2;
    
    NSLayoutConstraint *blueBox2Height = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueBox2Width = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueBox2Y = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:.5 constant:0];
    NSLayoutConstraint *blueBox2X = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.blueBox2 addConstraint:blueBox2Height];
    [self.blueBox2 addConstraint:blueBox2Width];
    [self.framingView addConstraint:blueBox2Y];
    [self.framingView addConstraint:blueBox2X];
    
    UIView *blueBox3 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    
    [self.framingView addSubview:blueBox3];
    self.blueBox3 = blueBox3;
    
    NSLayoutConstraint *blueBox3Height = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueBox3Width = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueBox3Y = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0];
    NSLayoutConstraint *blueBox3X = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.blueBox3 addConstraint:blueBox3Height];
    [self.blueBox3 addConstraint:blueBox3Width];
    [self.framingView addConstraint:blueBox3Y];
    [self.framingView addConstraint:blueBox3X];
    
    UIView *redBox = [[[UIView alloc] init] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    
    [self.framingView addSubview:redBox];
    self.redBox = redBox;
    
    NSLayoutConstraint *redBoxHeight = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:45];
    
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:135];
    
    NSLayoutConstraint *redBoxTop = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    
    NSLayoutConstraint *redBoxRight = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    
    [self.redBox addConstraint:redBoxHeight];
    [self.redBox addConstraint:redBoxWidth];
    [self.framingView addConstraint:redBoxTop];
    [self.framingView addConstraint:redBoxRight];
    
    UIView *orangeBox1 = [[[UIView alloc] init] initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    
    [self.redBox addSubview:orangeBox1];
    self.orangeBox1 = orangeBox1;
    
    NSLayoutConstraint *orangeBox1Height = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:30];
    
    NSLayoutConstraint *orangeBox1Width = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50];
    
    NSLayoutConstraint *orangeBox1Top = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.redBox attribute:NSLayoutAttributeTop multiplier:1.0 constant:7];
    
    NSLayoutConstraint *orangeBox1Right = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem:self.redBox attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    
    [self.orangeBox1 addConstraint:orangeBox1Height];
    [self.orangeBox1 addConstraint:orangeBox1Width];
    [self.redBox addConstraint:orangeBox1Top];
    [self.redBox addConstraint:orangeBox1Right];
    
    
    
    UIView *orangeBox2 = [[[UIView alloc] init] initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    
    [self.redBox addSubview:orangeBox2];
    self.orangeBox2 = orangeBox2;
    
    NSLayoutConstraint *orangeBox2Height = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:30];
    
    NSLayoutConstraint *orangeBox2Width = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:55];
    
    
    NSLayoutConstraint *orangeBox2Top = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.redBox attribute:NSLayoutAttributeTop multiplier:1.0 constant:7];
    
    NSLayoutConstraint *orangeBox2Left = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.redBox attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    [self.orangeBox2 addConstraint:orangeBox2Height];
    [self.orangeBox2 addConstraint:orangeBox2Width];
    [self.redBox addConstraint:orangeBox2Top];
    [self.redBox addConstraint:orangeBox2Left];
    
    

}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
