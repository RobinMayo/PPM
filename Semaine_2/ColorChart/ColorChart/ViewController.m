//
//  ViewController.m
//  NuancierRVB
//
//  Created by Robin Blottière--Mayo on 15/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


/* ********** Private Default Methods ********** */

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


/* ********** Private Personalised Methods ********** */

- (void)changeColor {
	float red = [_RedSliderOutlet value] / [_RedSliderOutlet maximumValue];
	float green = [_GreenSliderOutlet value] / [_GreenSliderOutlet maximumValue];
	float blue = [_BlueSliderOutlet value] / [_BlueSliderOutlet maximumValue];

	[_RedSliderOutlet setValue:(int)(red * [_RedSliderOutlet maximumValue])];
	[_GreenSliderOutlet setValue:(int)(green * [_RedSliderOutlet maximumValue])];
	[_BlueSliderOutlet setValue:(int)(blue * [_RedSliderOutlet maximumValue])];
	[_ActuelButtonOutlet setBackgroundColor:
	[[UIColor alloc] initWithRed:red green:green blue:blue alpha:1]];
}

- (void)restoreColor {
	UIColor *color = [_ActuelButtonOutlet backgroundColor];
	const CGFloat* components = CGColorGetComponents([color CGColor]);
	NSLog(@"Red: %f", components[0]);
	NSLog(@"Green: %f", components[1]);
	NSLog(@"Blue: %f", components[2]);
	if (_WebSwitchOutlet.on == true) {
		[_RedSliderOutlet setValue:(int)(components[0] * 10)];
		[_GreenSliderOutlet setValue:(int)(components[1] * 10)];
		[_BlueSliderOutlet setValue:(int)(components[2] * 10)];
	} else {
		[_RedSliderOutlet setValue:(int)(components[0] * 100)];
		[_GreenSliderOutlet setValue:(int)(components[1] * 100)];
		[_BlueSliderOutlet setValue:(int)(components[2] * 100)];
	}
	[self changeRedLabelValue];
	[self changeGreenLabelValue];
	[self changeBlueLabelValue];
}

- (void)changeRedLabelValue {
	if (_WebSwitchOutlet.on == true) {
		[_RedLabelOutlet setText:[NSString stringWithFormat:@"R : %d%%",
								  (int)[_RedSliderOutlet value] * 10]];
	} else {
		[_RedLabelOutlet setText:[NSString stringWithFormat:@"R : %d%%",
								  (int)[_RedSliderOutlet value]]];
	}
}

- (void)changeGreenLabelValue {
	if (_WebSwitchOutlet.on == true) {
		[_GreenLabelOutlet setText:[NSString stringWithFormat:@"V : %d%%",
									(int)[_GreenSliderOutlet value] * 10]];
	} else {
		[_GreenLabelOutlet setText:[NSString stringWithFormat:@"V : %d%%",
									(int)[_GreenSliderOutlet value]]];
	}
}

- (void)changeBlueLabelValue {
	if (_WebSwitchOutlet.on == true) {
		[_BlueLabelOutlet setText:[NSString stringWithFormat:@"B : %d%%",
								   (int)[_BlueSliderOutlet value] * 10]];
	} else {
		[_BlueLabelOutlet setText:[NSString stringWithFormat:@"B : %d%%",
								   (int)[_BlueSliderOutlet value]]];
	}
}


/* ********** Actions ********** */

- (IBAction)PenultiemeButtonAction:(id)sender {
	[_ActuelButtonOutlet setBackgroundColor:
	 [_PenultiemeButtonOutlet backgroundColor]];
	[self restoreColor];
}

- (IBAction)PrecedentButtonAction:(id)sender {
	[_ActuelButtonOutlet setBackgroundColor:
	 [_PrecedentButtonOutlet backgroundColor]];
	[self restoreColor];
}

- (IBAction)RedSliderAction:(id)sender {
	[self changeColor];
	[self changeRedLabelValue];
}

- (IBAction)GreenSliderAction:(id)sender {
	[self changeColor];
	[self changeGreenLabelValue];
}

- (IBAction)BlueSliderAction:(id)sender {
	[self changeColor];
	[self changeBlueLabelValue];
}

- (IBAction)MemoriserButtonAction:(id)sender {
	[_PenultiemeButtonOutlet setBackgroundColor:
	 [_PrecedentButtonOutlet backgroundColor]];
	[_PrecedentButtonOutlet setBackgroundColor:
	 [_ActuelButtonOutlet backgroundColor]];
}

- (IBAction)RaZButtonAction:(id)sender {
	_RedSliderOutlet.value = [_RedSliderOutlet maximumValue] / 2.0;
	_GreenSliderOutlet.value = [_GreenSliderOutlet maximumValue] / 2.0;
	_BlueSliderOutlet.value = [_BlueSliderOutlet maximumValue] / 2.0;
	[_ActuelButtonOutlet setBackgroundColor:
	 [[UIColor alloc] initWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
	[self changeRedLabelValue];
	[self changeGreenLabelValue];
	[self changeBlueLabelValue];
}

- (IBAction)WebSwitchAction:(id)sender {
	if (_WebSwitchOutlet.on == true) {
		if ((int)_RedSliderOutlet.value % 10 < 5) {
			[_RedSliderOutlet setValue:(int)[_RedSliderOutlet value] / 10];
		} else {
			[_RedSliderOutlet setValue:((int)[_RedSliderOutlet value] / 10) + 1];
		}
		if ((int)_GreenSliderOutlet.value % 10 < 5) {
			[_GreenSliderOutlet setValue:(int)[_GreenSliderOutlet value] / 10];
		} else {
			[_GreenSliderOutlet setValue:((int)[_GreenSliderOutlet value] / 10) + 1];
		}
		if ((int)_BlueSliderOutlet.value % 10 < 5) {
			[_BlueSliderOutlet setValue:(int)[_BlueSliderOutlet value] / 10];
		} else {
			[_BlueSliderOutlet setValue:((int)[_BlueSliderOutlet value] / 10) + 1];
		}
		[_RedSliderOutlet setMaximumValue:10];
		[_GreenSliderOutlet setMaximumValue:10];
		[_BlueSliderOutlet setMaximumValue:10];
		[self changeRedLabelValue];
		[self changeGreenLabelValue];
		[self changeBlueLabelValue];
	} else {
		[_RedSliderOutlet setMaximumValue:100];
		[_GreenSliderOutlet setMaximumValue:100];
		[_BlueSliderOutlet setMaximumValue:100];
		[_RedSliderOutlet setValue:(int)[_RedSliderOutlet value] * 10];
		[_GreenSliderOutlet setValue:(int)[_GreenSliderOutlet value] * 10];
		[_BlueSliderOutlet setValue:(int)[_BlueSliderOutlet value] * 10];
	}
}

@end
