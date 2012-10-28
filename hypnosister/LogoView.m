//
//  Logo.m
//  hypnosister
//
//  Created by Joe Coleman on 10/28/12.
//  Copyright (c) 2012 Joe Coleman. All rights reserved.
//

#import "LogoView.h"

@implementation LogoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]] ;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // get center of rectangle
    CGRect bounds = [self bounds] ;
    CGPoint center ;
    center.x = bounds.origin.x + bounds.size.width / 2.0 ;
    center.y = bounds.origin.y + bounds.size.height / 2.0 ;
    
    // get current graphics context
    CGContextRef ctx = UIGraphicsGetCurrentContext() ;
    
    // read in the logo image
    UIImage *logo = [UIImage imageNamed:@"Icon.png"] ;
    
    // save graphics context settings
    CGContextSaveGState(ctx) ;
    
    CGContextAddArc(ctx, center.x, center.y, 25, 0, M_PI * 2.0, YES) ;
    CGContextClip(ctx) ;
    
    [logo drawInRect:rect] ;
    
    // gradients require a few steps
    // first create a CGGraidentRef. the primary component of this is an array of color values.
    // each color is made up of 4 values (r,g,b,a)
    CGFloat gradientColors[] = {0.0, 0.0, 1.0, 0.5, 1.0, 1.0, 1.0, 0.0} ;
    // we use NULL for the location list (defaults to [0.0,1.0]) and 2 locations
    CGGradientRef logoGradientRef = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), gradientColors, NULL, 2) ;
    // create points for where the gradient starts and ends
    CGPoint gradientStartPoint = CGPointMake(center.x, 0) ;
    CGPoint gradientEndPoint = CGPointMake(center.x, center.y) ;
    // draw the actual gradient
    CGContextDrawLinearGradient(ctx, logoGradientRef, gradientStartPoint, gradientEndPoint, kCGGradientDrawsBeforeStartLocation);
    
    // switch back to original settings
    CGContextRestoreGState(ctx) ;
    
    // create a shadow. it's very hard to see. change the color if you want to see it easier
    CGSize offset = CGSizeMake (0,2) ;
    CGColorRef color = [[UIColor darkGrayColor] CGColor] ;
    CGContextSetShadowWithColor(ctx, offset, 2.0, color) ;
    
    // stroke the circle
    CGContextSetLineWidth(ctx, 1) ;
    CGContextAddArc(ctx, center.x, center.y, 25, 0, M_PI * 2.0, YES) ;
    CGContextStrokePath(ctx) ; // circle/shadow won't actually be drawn unless this is called
    
}


@end
