//
//  ViewController.m
//  Bonrevoir_C
//
//  Created by Robin Blottière--Mayo on 29/08/2018.
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

- (IBAction)BonjourButton:(id)sender {
	if ([_BonjourLabel.text isEqual: @""]) {
		[_BonjourLabel setText:(@"Hello")];
		[_BonjourButtonLabel setTitle:@"SayBye" forState:(UIControlStateNormal)];
	} else {
		if ([_BonjourLabel.text isEqual: @"Hello"]) {
			[_BonjourLabel setText:(@"Bye bye")];
			[_BonjourButtonLabel setTitle:@"SayHello" forState:(UIControlStateNormal)];
		} else {
			[_BonjourLabel setText:(@"Hello")];
			[_BonjourButtonLabel setTitle:@"SayBye" forState:(UIControlStateNormal)];
		}
	}
}

@end
