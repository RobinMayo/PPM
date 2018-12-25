//
//  ViewController.h
//  Couleur_C
//
//  Created by Robin Blottière--Mayo on 04/09/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *ColorView;
@property (weak, nonatomic) IBOutlet UIStepper *ColorOutletStepper;

- (IBAction)ChangeColorStepper:(id)sender;

@end

