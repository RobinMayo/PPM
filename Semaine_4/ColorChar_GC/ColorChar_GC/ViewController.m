//
//  ViewController.m
//  ColorChar_GC
//
//  Created by Robin Blottière--Mayo on 21/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import "ViewController.h"
#import "View.h"


@interface ViewController ()

@end

@implementation ViewController

View *v;
	
- (void)viewDidLoad {
	[super viewDidLoad];
	UIScreen *screen = [UIScreen mainScreen];
	CGRect rect = [screen bounds];
	v = [[View alloc] initWithFrame:rect];
	[self setView:v];
	[v release];
	[v drawInFormat:rect.size];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	[v drawInFormat:size];
}

- (void)changeColor {
	float red = [[v redSlider] value] / [[v redSlider] maximumValue];
	float green = [[v greenSlider] value] / [[v greenSlider] maximumValue];
	float blue = [[v blueSlider] value] / [[v blueSlider] maximumValue];
	
	[[v redSlider] setValue:(int)(red * [[v redSlider] maximumValue])];
	[[v greenSlider] setValue:(int)(green * [[v redSlider] maximumValue])];
	[[v blueSlider] setValue:(int)(blue * [[v redSlider] maximumValue])];
	[[v currentButton] setBackgroundColor:
	[[UIColor alloc] initWithRed:red green:green blue:blue alpha:1]];
}
	
- (void)restoreColor {
	UIColor *color = [[v currentButton] backgroundColor];
	const CGFloat* components = CGColorGetComponents([color CGColor]);
	//NSLog(@"Red: %f", components[0]);
	//NSLog(@"Green: %f", components[1]);
	//NSLog(@"Blue: %f", components[2]);
	if (v.webSwitch.on == true) {
		[[v redSlider] setValue:(int)(components[0] * 10)];
		[[v greenSlider] setValue:(int)(components[1] * 10)];
		[[v blueSlider] setValue:(int)(components[2] * 10)];
	} else {
		[[v redSlider] setValue:(int)(components[0] * 100)];
		[[v greenSlider] setValue:(int)(components[1] * 100)];
		[[v blueSlider] setValue:(int)(components[2] * 100)];
	}
	[self changeRedLabelValue];
	[self changeGreenLabelValue];
	[self changeBlueLabelValue];
}
	
- (void)changeRedLabelValue {
	if (v.webSwitch.on == true) {
		[[v redLabel] setText:[NSString stringWithFormat:@"R : %d%%",
								  (int)[[v redSlider] value] * 10]];
	} else {
		[[v redLabel] setText:[NSString stringWithFormat:@"R : %d%%",
								  (int)[[v redSlider] value]]];
	}
}
	
- (void)changeGreenLabelValue {
	if (v.webSwitch.on == true) {
		[v.greenLabel setText:[NSString stringWithFormat:@"V : %d%%",
									(int)[[v greenSlider] value] * 10]];
	} else {
		[v.greenLabel setText:[NSString stringWithFormat:@"V : %d%%",
									(int)[[v greenSlider] value]]];
	}
}
	
- (void)changeBlueLabelValue {
	if (v.webSwitch.on == true) {
		[[v blueLabel] setText:[NSString stringWithFormat:@"B : %d%%",
								   (int)[[v blueSlider] value] * 10]];
	} else {
		[[v blueLabel] setText:[NSString stringWithFormat:@"B : %d%%",
								   (int)[[v blueSlider] value]]];
	}
}
	
	
/* ********** Actions ********** */

- (void) penultimateButtonAction:(UIButton*)sender {
	[[v currentButton] setBackgroundColor:
	 [[v penultimateButton] backgroundColor]];
	[self restoreColor];
	[v setNeedsDisplay];
}
	
- (void) previousButtonAction:(UIButton*)sender {
	[[v currentButton] setBackgroundColor:
	 [[v previousButton] backgroundColor]];
	[self restoreColor];
	[v setNeedsDisplay];
}
	
- (void) redSliderAction:(UISlider*)sender {
	[self changeColor];
	[self changeRedLabelValue];
	[v setNeedsDisplay];
}
	
- (void) greenSliderAction:(UISlider*)sender {
	[self changeColor];
	[self changeGreenLabelValue];
	[v setNeedsDisplay];
}
	
- (void) blueSliderAction:(UISlider*)sender {
	[self changeColor];
	[self changeBlueLabelValue];
	[v setNeedsDisplay];
}
	
- (void) memorizeButtonAction:(UIButton*)sender {
	[[v penultimateButton] setBackgroundColor:
	 [[v previousButton] backgroundColor]];
	[[v previousButton] setBackgroundColor:
	 [[v currentButton] backgroundColor]];
	[v setNeedsDisplay];
}
	
- (void) resetButtonAction:(UIButton*)sender {
	v.redSlider.value = [[v redSlider] maximumValue] / 2.0;
	v.greenSlider.value = [[v greenSlider] maximumValue] / 2.0;
	v.blueSlider.value = [[v blueSlider] maximumValue] / 2.0;
	[[v currentButton] setBackgroundColor:
	 [[UIColor alloc] initWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
	[self changeRedLabelValue];
	[self changeGreenLabelValue];
	[self changeBlueLabelValue];
	[v setNeedsDisplay];
}
	
- (void) webSwitchAction:(UISwitch*)sender {
	if (v.webSwitch.on == true) {
		if ((int)[[v redSlider] value] % 10 < 5) {
			[[v redSlider] setValue:(int)[[v redSlider] value] / 10];
		} else {
			[[v redSlider] setValue:((int)[[v redSlider] value] / 10) + 1];
		}
		if ((int)v.greenSlider.value % 10 < 5) {
			[[v greenSlider] setValue:(int)[[v greenSlider] value] / 10];
		} else {
			[[v greenSlider] setValue:((int)[[v greenSlider] value] / 10) + 1];
		}
		if ((int)v.blueSlider.value % 10 < 5) {
			[[v blueSlider] setValue:(int)[[v blueSlider] value] / 10];
		} else {
			[[v blueSlider] setValue:((int)[[v blueSlider] value] / 10) + 1];
		}
		[[v redSlider] setMaximumValue:10];
		[[v greenSlider] setMaximumValue:10];
		[[v blueSlider] setMaximumValue:10];
		[self changeRedLabelValue];
		[self changeGreenLabelValue];
		[self changeBlueLabelValue];
	} else {
		[[v redSlider] setMaximumValue:100];
		[[v greenSlider] setMaximumValue:100];
		[[v blueSlider] setMaximumValue:100];
		[[v redSlider] setValue:(int)[[v redSlider] value] * 10];
		[[v greenSlider] setValue:(int)[[v greenSlider] value] * 10];
		[[v blueSlider] setValue:(int)[[v blueSlider] value] * 10];
	}
	[v setNeedsDisplay];
}

@end
