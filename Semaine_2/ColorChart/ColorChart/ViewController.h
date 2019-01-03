//
//  ViewController.h
//  NuancierRVB
//
//  Created by Robin Blottière--Mayo on 15/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *PenultiemeButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *PrecedentButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *ActuelButtonOutlet;

@property (weak, nonatomic) IBOutlet UILabel *RedLabelOutlet;
@property (weak, nonatomic) IBOutlet UISlider *RedSliderOutlet;
@property (weak, nonatomic) IBOutlet UILabel *GreenLabelOutlet;
@property (weak, nonatomic) IBOutlet UISlider *GreenSliderOutlet;
@property (weak, nonatomic) IBOutlet UISlider *BlueSliderOutlet;
@property (weak, nonatomic) IBOutlet UILabel *BlueLabelOutlet;

@property (weak, nonatomic) IBOutlet UISwitch *WebSwitchOutlet;

- (IBAction)PenultiemeButtonAction:(id)sender;
- (IBAction)PrecedentButtonAction:(id)sender;

- (IBAction)RedSliderAction:(id)sender;
- (IBAction)GreenSliderAction:(id)sender;
- (IBAction)BlueSliderAction:(id)sender;

- (IBAction)MemoriserButtonAction:(id)sender;
- (IBAction)RaZButtonAction:(id)sender;
- (IBAction)WebSwitchAction:(id)sender;

@end

