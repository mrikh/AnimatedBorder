//
//  UIView+Border.h
//  MRButtonBorder
//
//  Created by Mayank Rikh on 20/01/17.
//  Copyright © 2017 Mayank Rikh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;


-(void)createBorder;

-(void)startDrawingBorder;

-(void)clearBorder;

@end
