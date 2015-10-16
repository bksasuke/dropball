//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"StarsField", CLASS: @"StarsField"},
                                    @{TITLE: @"Basic View", CLASS: @"BasicView"},
                                    @{TITLE: @"Chess", CLASS: @"Chess"},
                                                                        ]};
    NSDictionary* Immediate = @{SECTION: @"Timer Animation", MENU: @[
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"},
                                    @{TITLE: @"Drop Ball", CLASS: @"DropBall"} ]};
    
    mainScreen.menu = @[basic,Immediate];
    mainScreen.title = @"UIView Advanced";
    mainScreen.about = @"Student 's HomeWork";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
