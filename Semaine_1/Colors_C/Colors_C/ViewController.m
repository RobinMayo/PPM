//
//  ViewController.m
//  Couleur_C
//
//  Created by Robin Blottière--Mayo on 04/09/2018.
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

- (IBAction)ChangeColorStepper:(id)sender {
	int v = (int)_ColorOutletStepper.value;
	switch (v) {
		case 0:
			[_ColorView setBackgroundColor:(UIColor.yellowColor)];
			break;
		case 1:
			[_ColorView setBackgroundColor:(UIColor.redColor)];
			break;
		case 2:
			[_ColorView setBackgroundColor:(UIColor.greenColor)];
			break;
		case 3:
			[_ColorView setBackgroundColor:(UIColor.blueColor)];
			break;
		case 4:
			[_ColorView setBackgroundColor:(UIColor.blackColor)];
			break;
		case 5:
			[_ColorView setBackgroundColor:(UIColor.cyanColor)];
			break;
		case 6:
			[_ColorView setBackgroundColor:(UIColor.magentaColor)];
			break;
		default:
			[_ColorView setBackgroundColor:(UIColor.brownColor)];
			break;
	}
}

@end
