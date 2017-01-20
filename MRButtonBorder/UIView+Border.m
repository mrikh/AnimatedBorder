//
//  UIView+Border.m
//  MRButtonBorder
//
//  Created by Mayank Rikh on 20/01/17.
//  Copyright © 2017 Mayank Rikh. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)

-(void)createBorder{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    
    CAShapeLayer *borderLayer = [CAShapeLayer new];
    
    borderLayer.path = path.CGPath;

    borderLayer.strokeColor = [UIColor colorWithRed:173.0f/255.0f green:143.0f/255.0f blue:86.0f/255.0f alpha:1.0f].CGColor;
    
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    borderLayer.lineWidth = 2.0f;
    
    //so that we don't draw it right away
    borderLayer.strokeEnd = 0.0f;
    
    [borderLayer setValue:@1005 forKey:@"animationTag"];
    
    [self.layer addSublayer:borderLayer];
}

-(void)startDrawingBorder{
    
    //get our shapeLayer reference
    
    [self startAnimatingWithFrom:@0 andToValue:@1 andShouldClear:NO];
}

-(void)clearBorder{
    
    [self startAnimatingWithFrom:@1 andToValue:@0 andShouldClear:YES];
}

#pragma mark - Private Functions

-(void)startAnimatingWithFrom:(NSNumber *)fromValue andToValue:(NSNumber *)toValue andShouldClear:(BOOL)clear{
    
    //get our shapeLayer reference
    
    CAShapeLayer *borderLayer;
    
    for (CAShapeLayer *shapeLayer in self.layer.sublayers){
        
        if ([[shapeLayer valueForKey:@"animationTag"] floatValue] == 1005){
            
            borderLayer = shapeLayer;
            
            break;
        }
    }
    
    
    //we want to animate stroke end
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    animation.duration = 0.5f;
    
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    if(clear){
        
        if (borderLayer.strokeEnd != 1.0f){
            
            return;
        }
        
        [borderLayer removeAnimationForKey:@"strokeEnd"];
        
        borderLayer.strokeEnd = 0.0f;
    }else{
        
        if (borderLayer.strokeEnd != 0.0f){
            
            return;
        }
        
        borderLayer.strokeEnd = 1.0f;
    }
    
    // Do the actual animation
    [borderLayer addAnimation:animation forKey:@"strokeEnd"];
}


@end
