//
//  Chess.m
//  stars
//
//  Created by student on 10/12/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "Chess.h"
#import <QuartzCore/QuartzCore.h>
@interface Chess ()
@end

@implementation Chess
UIView *square;
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor grayColor];
    [self addslider];
    [self drawchesstable];
}

-(void) drawchesstable {
    CGFloat margin = 20;
    square = [[UIView alloc ] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width-2*margin, self.view.bounds.size.width-2*margin)];
    square.backgroundColor = [UIColor whiteColor] ;
    [self.view addSubview:square];
    square.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    int cellWidth = (self.view.bounds.size.width -margin*2)/8;
    for (int  row=0; row<8; row++) {
        for (int col=0; col<8; col++) {
            UIView *rect;
            rect = [[UIView alloc]initWithFrame:CGRectMake(col*cellWidth, row*cellWidth, cellWidth, cellWidth)];
            if (row%2 ==0) {//even row
                rect.backgroundColor = (col %2 ==0) ? [UIColor blackColor] :[UIColor whiteColor];
            } else {
                rect.backgroundColor = (col %2 ==0) ? [UIColor whiteColor] :[UIColor blackColor];
            }
            [square addSubview:rect];
        }
        
    }
}

-(void) addslider {
    CGRect frame = CGRectMake(20, self.view.bounds.size.height-100, self.view.bounds.size.width-40, 10.0);
    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    slider.continuous = YES;
    slider.value = 0;
    [self.view addSubview: slider];
}
-(void)sliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    float value = slider.value;
    square.transform = CGAffineTransformMakeRotation(value * M_PI);
    
    
}



@end





