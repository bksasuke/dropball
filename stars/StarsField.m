//
//  StarsField.m
//  stars
//
//  Created by student on 10/10/15.
//  Copyright © 2015 student. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "StarsField.h"

@interface StarsField ()
//{bool bugDead;
//
//}

@end


@implementation StarsField
{
    UIImageView *red,*violet,*brown,*green;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.edgesForExtendedLayout =UIRectEdgeNone ;
 
    [self drawstars];
    [self Animate];
    
}

- (void)drawstars {
    red =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 64, 64 )];
    red.image = [ UIImage imageNamed:@"red"];
    [self.view addSubview:red];
    violet =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 64, 64 )];
    violet.image = [ UIImage imageNamed:@"violet"];
    [self.view addSubview:violet];
    brown =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 64, 64 )];
    brown.image = [ UIImage imageNamed:@"brown"];
    [self.view addSubview:brown];
    green =[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 64, 64 )];
    green.image = [ UIImage imageNamed:@"green"];
    [self.view addSubview:green];

}
-(void)Animate{
       float X =100, Y=100;
    red.transform =CGAffineTransformIdentity;
    violet.transform =CGAffineTransformIdentity;
    brown.transform =CGAffineTransformIdentity;
    green.transform =CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        brown.center = CGPointMake(self.view.bounds.size.width/2-100, self.view.bounds.size.height/2-100 );
        red.center   = CGPointMake(self.view.bounds.size.width/2+X, self.view.bounds.size.height/2+Y);
        green.center = CGPointMake(self.view.bounds.size.width/2+X, self.view.bounds.size.height/2-Y);
        violet.center= CGPointMake(self.view.bounds.size.width/2-X,self.view.bounds.size.height/2+Y);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            brown.center = CGPointMake(self.view.bounds.size.width/2-X, self.view.bounds.size.height/2);
            green.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2-Y);
            red.center   = CGPointMake(self.view.bounds.size.width/2+X, self.view.bounds.size.height/2);
            violet.center= CGPointMake(self.view.bounds.size.width/2,self.view.bounds.size.height/2+Y);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:3 animations:^{
                [self vitri];
            } completion:^(BOOL finished) {
                [self Animate];
            }];
        
        
         }];
    }];
}
-(void) vitri {
    red.center =CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    violet.center =CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    brown.center =CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    green.center =CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    
}




@end

