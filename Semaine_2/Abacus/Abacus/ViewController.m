//
//  ViewController.m
//  Dizainier_
//
//  Created by Robin Blottière--Mayo on 05/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)assignmentMethode:(int)value {
	NSString *decimalNumber;
	if (_SwitchOutlet.isOn) {
		decimalNumber = [NSString stringWithFormat:@"%X", value];
	} else {
		decimalNumber = [NSString stringWithFormat:@"%d", value];
	}
	if ((int)_StepperOutlet.value == 42) {
		[_NumberLabelOutlet setTextColor:UIColor.redColor];
		[_NumberLabelOutlet setFont:[UIFont boldSystemFontOfSize:17.0]];
	} else {
		[_NumberLabelOutlet setTextColor:UIColor.whiteColor];
		[_NumberLabelOutlet setFont:[UIFont systemFontOfSize:17.0]];
	}
	[_NumberLabelOutlet setText:decimalNumber];
	[_SliderOutlet setValue:value];
	_TensSegmentOutlet.selectedSegmentIndex = value / 10;
	_UnitsSegmentOutlet.selectedSegmentIndex = value % 10;
	[decimalNumber release];
}

- (IBAction)StepperAction:(id)sender {
	[self assignmentMethode:(int)_StepperOutlet.value];
}

- (IBAction)SliderAction:(id)sender {
	_StepperOutlet.value = (int)_SliderOutlet.value;
	[self assignmentMethode:(int)_StepperOutlet.value];
}

- (void)segmentedControlMethode {
	_StepperOutlet.value = (int)_UnitsSegmentOutlet.selectedSegmentIndex + 10 * (int)_TensSegmentOutlet.selectedSegmentIndex;
	[self assignmentMethode:(int)_StepperOutlet.value];
}

- (IBAction)TensSegmentAction:(id)sender {
	[self segmentedControlMethode];
}

- (IBAction)UnitsSegmentAction:(id)sender {
	[self segmentedControlMethode];
}

- (IBAction)SwitchAction:(id)sender {
	NSString *decimalNumber;
	if (_SwitchOutlet.isOn) {
		decimalNumber = [NSString stringWithFormat:@"%X", (int)_StepperOutlet.value];
	} else {
		decimalNumber = [NSString stringWithFormat:@"%d", (int)_StepperOutlet.value];
	}
	[_NumberLabelOutlet setText:decimalNumber];
	[decimalNumber release];
}

- (IBAction)RaZButton:(UIButton *)sender {
	_StepperOutlet.value = 0;
	[_NumberLabelOutlet setText:@"0"];
	[_SliderOutlet setValue:0];
	_TensSegmentOutlet.selectedSegmentIndex = 0;
	_UnitsSegmentOutlet.selectedSegmentIndex = 0;
}

@end
