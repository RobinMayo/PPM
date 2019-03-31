//
//  View.h
//  ColorChar_GC
//
//  Created by Robin Blottière--Mayo on 21/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#ifndef View_h
#define View_h

#import <UIKit/UIKit.h>

@interface View : UIView

- (void) drawInFormat:(CGSize) format;

@property (readonly, nonatomic, retain) UILabel *penultimateLabel;
@property (readonly, nonatomic, retain) UILabel *previousLabel;
@property (readonly, nonatomic, retain) UILabel *currentLabel;

@property (readonly, nonatomic, retain) UIButton *penultimateButton;
@property (readonly, nonatomic, retain) UIButton *previousButton;
@property (readonly, nonatomic, retain) UIButton *currentButton;

@property (readonly, nonatomic, retain) UILabel *redLabel;
@property (readonly, nonatomic, retain) UILabel *greenLabel;
@property (readonly, nonatomic, retain) UILabel *blueLabel;

@property (readonly, nonatomic, retain) UISlider *redSlider;
@property (readonly, nonatomic, retain) UISlider *greenSlider;
@property (readonly, nonatomic, retain) UISlider *blueSlider;

@property (readonly, nonatomic, retain) UIButton *memorizeButton;
@property (readonly, nonatomic, retain) UIButton *resetButton;

@property (readonly, nonatomic, retain) UISwitch *webSwitch;
@property (readonly, nonatomic, retain) UILabel *webLabel;

@property (readonly, nonatomic, retain) UIDevice *device;

@end

#endif
