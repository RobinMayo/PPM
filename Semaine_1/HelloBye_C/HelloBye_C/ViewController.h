//
//  ViewController.h
//  Bonrevoir_C
//
//  Created by Robin Blottière--Mayo on 29/08/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *BonjourLabel;
@property (weak, nonatomic) IBOutlet UIButton *BonjourButtonLabel;

- (IBAction)BonjourButton:(id)sender;

@end

