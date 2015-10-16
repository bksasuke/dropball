//
//  DropBall.m
//  DropBall
//
//  Created by student on 10/16/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat ballRadius;
    CGFloat x,y, velocityY, accellerateY, maxHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.016
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
    
}
-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"ball"]];
    ballRadius = 32;
    x = mainViewSize.width *0.5;
    y = ballRadius;
    velocityY = 0.0;
    accellerateY = .25;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height +self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}
-(void) dropBall {
    
    velocityY += accellerateY;
    y += velocityY;
    if (y>maxHeight) {
        velocityY = -velocityY*.98; //damper
        y=maxHeight;
    }
    ball.center= CGPointMake(x, y);
}
@end
