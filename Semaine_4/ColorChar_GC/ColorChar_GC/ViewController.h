//
//  ViewController.h
//  ColorChar_GC
//
//  Created by Robin Blottière--Mayo on 21/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"

@interface ViewController : UIViewController
	
- (void) penultimateButtonAction:(UIButton*)sender;
- (void) previousButtonAction:(UIButton*)sender;

- (void) redSliderAction:(UISlider*)sender;
- (void) greenSliderAction:(UISlider*)sender;
- (void) blueSliderAction:(UISlider*)sender;
	
- (void) memorizeButtonAction:(UIButton*)sender;
- (void) resetButtonAction:(UIButton*)sender;
- (void) webSwitchAction:(UISwitch*)sender;

@end
