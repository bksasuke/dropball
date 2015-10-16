//
//  RollingBall.m
//  stars
//
//  Created by student on 10/15/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end
CGFloat deltalAngle = 0.5;
@implementation RollingBall
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat deltalAngle ;
    CGFloat angle;
    CGFloat ballRadius;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBall];
    
    angle =0.0;
    deltalAngle=.5;
    timer =[NSTimer scheduledTimerWithTimeInterval:0.1
                                            target:self
                                          selector:@selector(rollBall)
                                          userInfo:nil
                                           repeats:true];
}
-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball"]];
    ballRadius = 32.0;
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    [self.view addSubview:ball];
}

-(void) rollBall {
    
    if (ball.center.x >0) {
        angle += deltalAngle;
        ball.transform = CGAffineTransformMakeRotation(angle);
        ball.center = CGPointMake(ball.center.x+ballRadius*deltalAngle, ball.center.y);
        NSLog(@"So goc quay cua qua bong la:%f",angle);
    } if (ball.center.x > self.view.bounds.size.width-ballRadius) {
        deltalAngle =-0.5;}
    if (ball.center.x <ballRadius){deltalAngle=.5;
        ball.center = CGPointMake(ballRadius, self.view.bounds.size.height * 0.5);
        
    }
    
    }

    

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}



@end





/* ball.transform = CGAffineTransformIdentity;
 [UIView animateWithDuration:2 animations:^{
 ball.center = CGPointMake(self.view.bounds.size.width-ballRadius,self.view.bounds.size.height/2 );
 } completion:^(BOOL finished) {
 ball.transform = CGAffineTransformConcat(
 CGAffineTransformMakeScale(-1, 1),
 CGAffineTransformMakeRotation(angle=angle+.5));
 [UIView animateWithDuration:2 animations:^{
 ball.center = CGPointMake(ballRadius, self.view.bounds.size.height/2);
 } completion:^(BOOL finished){
 [self rollBall];
 }];
 
 }];*/
