//
//  hypnosisterAppDelegate.h
//  hypnosister
//
//  Created by Joe Coleman on 10/14/12.
//  Copyright (c) 2012 Joe Coleman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface hypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView *view ;
}

@property (strong, nonatomic) UIWindow *window;

@end
