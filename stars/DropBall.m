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
    CGFloat x, y, velocityX, velocityY, maxHeight, maxWidth, ballRadius;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addBall];
    
    NSURL *SoundURL = [ NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"switch" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)SoundURL, &playsound);

    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
    
}
-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"ball12"]];
    ballRadius = 16;
    x = ballRadius;
    y = ballRadius;
   velocityX=velocityY= .5;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height +self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight;
    maxWidth  = mainViewSize.width - ballRadius;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}
-(void) dropBall {
    
    x += ballRadius*velocityX;
    y += ballRadius*velocityY;
    if ( x>=maxWidth-ballRadius && y>=ballRadius) {
        velocityX=velocityX*-1;
        AudioServicesPlaySystemSound(playsound);
    }
    
    if ( x>=ballRadius && y>maxHeight-ballRadius) {
        velocityY=velocityY*-1;
        AudioServicesPlaySystemSound(playsound);
    }
    if (x<=ballRadius) {
        velocityX =velocityX*-1;
        AudioServicesPlaySystemSound(playsound);
    }
    if (y<=ballRadius) {
        velocityY =velocityY*-1;
        AudioServicesPlaySystemSound(playsound);
    }
    ball.center= CGPointMake(x, y);
}
@end
