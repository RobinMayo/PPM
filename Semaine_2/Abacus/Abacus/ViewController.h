//
//  ViewController.h
//  Dizainier
//
//  Created by Robin Blottière--Mayo on 05/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *NumberLabelOutlet;
@property (weak, nonatomic) IBOutlet UIStepper *StepperOutlet;
@property (weak, nonatomic) IBOutlet UISlider *SliderOutlet;
@property (weak, nonatomic) IBOutlet UISegmentedControl *TensSegmentOutlet;
@property (weak, nonatomic) IBOutlet UISegmentedControl *UnitsSegmentOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *SwitchOutlet;

- (IBAction)StepperAction:(id)sender;
- (IBAction)SliderAction:(id)sender;
- (IBAction)TensSegmentAction:(id)sender;
- (IBAction)UnitsSegmentAction:(id)sender;
- (IBAction)SwitchAction:(id)sender;
- (IBAction)RaZButton:(UIButton *)sender;

@end

