//
//  HypnosisView.m
//  hypnosister
//
//  Created by Joe Coleman on 10/14/12.
//  Copyright (c) 2012 Joe Coleman. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext() ;
    CGRect bounds = [self bounds] ;
    
    // figure out the center of the bounds rectangle
    CGPoint center ;
    center.x = bounds.origin.x + bounds.size.width/2.0 ;
    center.y = bounds.origin.y + bounds.size.height/2.0 ;
    
    // the radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0 ;
    
    // the thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10) ;
    
    //the color of the line should be gray (red/green/blue = 0.6, alpha = 1.0) ;
    CGContextSetRGBStrokeColor(ctx,0.6, 0.6, 0.6, 1.0) ;
    
    //add a shape to the context - this does not draw the shape
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES) ;
    
    // perform a drawing instruction ; draw current shape with current state
    CGContextStrokePath(ctx) ;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self)
    {
        // all hypnosisViews start with a clear background color
        [self setBackgroundColor:[UIColor clearColor]] ;
        
    }
return self ;
}

@end
