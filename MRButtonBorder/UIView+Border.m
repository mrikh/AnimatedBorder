//
//  UIView+Border.m
//  MRButtonBorder
//
//  Created by Mayank Rikh on 20/01/17.
//  Copyright © 2017 Mayank Rikh. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)

@dynamic borderColor, borderWidth;

-(void)createBorder{
    
    // dont create again if it already exists
    [self.layer addSublayer:[self setupBorderLayer]];
}

-(void)startDrawingBorder{
   
    [self startAnimatingWithFrom:@0 andToValue:@1 andShouldClear:NO];
}

-(void)clearBorder{
    
    [self startAnimatingWithFrom:@1 andToValue:@0 andShouldClear:YES];
}

#pragma mark - Private Functions

-(void)startAnimatingWithFrom:(NSNumber *)fromValue andToValue:(NSNumber *)toValue andShouldClear:(BOOL)clear{
    
    //get our shapeLayer reference
    
    CAShapeLayer *borderLayer = [self searchForLayer];
    
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

-(CAShapeLayer *)setupBorderLayer{
    
    CAShapeLayer *tempLayer = [self searchForLayer];
    
    if(tempLayer){
        
        //adjust bounds everytime you call setup
        tempLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius].CGPath;
        
        return tempLayer;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius];
    
    CAShapeLayer *borderLayer = [CAShapeLayer new];
    
    borderLayer.path = path.CGPath;
    
    borderLayer.fillColor = self.backgroundColor.CGColor;
    
    //so that we don't draw it right away
    borderLayer.strokeEnd = 0.0f;
    
    [borderLayer setValue:@1005 forKey:@"animationTag"];
    
    return borderLayer;
}

-(CAShapeLayer *)searchForLayer{
    
    CAShapeLayer *borderLayer;
    
    for (CAShapeLayer *shapeLayer in self.layer.sublayers){
        
        if ([[shapeLayer valueForKey:@"animationTag"] floatValue] == 1005){
            
            borderLayer = shapeLayer;
            
            break;
        }
    }
    
    return borderLayer;
}

-(CAShapeLayer *)createOrReturnLayer{
    
    CAShapeLayer *layer = [self searchForLayer];
    
    if (!layer){
        
        layer = [self setupBorderLayer];
        
        [self.layer addSublayer:layer];
    }
    
    return layer;
}

#pragma mark Setter

-(void)setBorderColor:(UIColor *)borderColor{
    
    CAShapeLayer *layer = [self createOrReturnLayer];
    
    layer.strokeColor = borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    
    CAShapeLayer *layer = [self createOrReturnLayer];
    
    layer.lineWidth = borderWidth;
}

@end
