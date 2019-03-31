//
//  View.m
//  ColorChar_GC
//
//  Created by Robin Blottière--Mayo on 21/10/2018.
//  Copyright © 2018 Robin Blottière--Mayo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View.h"
#import "ViewController.h"

@interface View ()
	
@end

@implementation View

- (id) initWithFrame:(CGRect)frame {
	if([super initWithFrame:frame]) {
		[self setBackgroundColor:[UIColor blackColor]];
		_device = [UIDevice currentDevice];
		
		
		/* ********** Buttons Zone : ********** */

		// Penultimate Label :
		_penultimateLabel = [[UILabel alloc] init];
		[_penultimateLabel setText:@"Penultimate"];
		[_penultimateLabel setTextColor:[UIColor cyanColor]];
		[_penultimateLabel setTextAlignment:NSTextAlignmentCenter];
		[self addSubview:_penultimateLabel];
		[_penultimateLabel release];
		
		// Penultimate Button :
		_penultimateButton = [[UIButton alloc] init];
		[_penultimateButton setBackgroundColor:[UIColor grayColor]];
		[self addSubview:_penultimateButton];
		[_penultimateButton addTarget:self.subviews
							   	action:@selector(penultimateButtonAction:)
								forControlEvents:UIControlEventTouchDown];
		[_penultimateButton release];
		
		// Previous Label :
		_previousLabel = [[UILabel alloc] init];
		[_previousLabel setText:@"Previous"];
		[_previousLabel setTextColor:[UIColor cyanColor]];
		[_previousLabel setTextAlignment:NSTextAlignmentCenter];
		[self addSubview:_previousLabel];
		[_previousLabel release];
		
		// Previous Button :
		_previousButton = [[UIButton alloc] init];
		[_previousButton setBackgroundColor:[UIColor grayColor]];
		[self addSubview:_previousButton];
		[_previousButton addTarget:self.subviews
							action:@selector(previousButtonAction:)
					 		forControlEvents:UIControlEventTouchDown];
		[_previousButton release];
		
		// Current Label :
		_currentLabel = [[UILabel alloc] init];
		[_currentLabel setText:@"Current"];
		[_currentLabel setTextColor:[UIColor cyanColor]];
		[_currentLabel setFont:[UIFont boldSystemFontOfSize:17]];
		[_currentLabel setTextAlignment:NSTextAlignmentCenter];
		[self addSubview:_currentLabel];
		[_currentLabel release];
		
		// Current Button :
		_currentButton = [[UIButton alloc] init];
		[_currentButton setBackgroundColor:[UIColor grayColor]];
		[self addSubview:_currentButton];
		[_currentButton release];
		
		
		/* ********** Sliders Zone : ********** */
		
		// Red Label :
		_redLabel = [[UILabel alloc] init];
		[_redLabel setText:@"R : 50%"];
		[_redLabel setTextColor:[UIColor cyanColor]];
		[self addSubview:_redLabel];
		[_redLabel release];
		
		// Red Slider :
		_redSlider = [[UISlider alloc] init];
		[_redSlider setMinimumTrackTintColor:[UIColor redColor]];
		[_redSlider setMaximumValue:0];
		[_redSlider setMaximumValue:10];
		[_redSlider setValue:5];
		[self addSubview:_redSlider];
		[_redSlider addTarget:self.subviews
						action:@selector(redSliderAction:)
			   			forControlEvents:UIControlEventValueChanged];
		[_redSlider release];
		
		// Green Label :
		_greenLabel = [[UILabel alloc] init];
		[_greenLabel setText:@"G : 50%"];
		[_greenLabel setTextColor:[UIColor cyanColor]];
		[self addSubview:_greenLabel];
		[_greenLabel release];
		
		// Green Slider :
		_greenSlider = [[UISlider alloc] init];
		[_greenSlider setMinimumTrackTintColor:[UIColor greenColor]];
		[_greenSlider setMaximumValue:0];
		[_greenSlider setMaximumValue:10];
		[_greenSlider setValue:5];
		[self addSubview:_greenSlider];
		[_greenSlider addTarget:self.subviews
							action:@selector(greenSliderAction:)
							forControlEvents:UIControlEventValueChanged];
		[_greenSlider release];
		
		// Blue Label :
		_blueLabel = [[UILabel alloc] init];
		[_blueLabel setText:@"B : 50%"];
		[_blueLabel setTextColor:[UIColor cyanColor]];
		[self addSubview:_blueLabel];
		[_blueLabel release];
		
		// Blue Slider :
		_blueSlider = [[UISlider alloc] init];
		[_blueSlider setMinimumTrackTintColor:[UIColor blueColor]];
		[_blueSlider setMaximumValue:0];
		[_blueSlider setMaximumValue:10];
		[_blueSlider setValue:5];
		[self addSubview:_blueSlider];
		[_blueSlider addTarget:self.subviews
						action:@selector(blueSliderAction:)
						forControlEvents:UIControlEventValueChanged];
		[_blueSlider release];
		
		
		/* ********** Bottom Zone : ********** */
		
		// Memorize Button :
		_memorizeButton = [[UIButton alloc] init];
		[_memorizeButton setTitle:@"Memorize" forState:UIControlStateNormal];
		[_memorizeButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
		[_memorizeButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[self addSubview:_memorizeButton];
		[_memorizeButton addTarget:self.subviews
							action:@selector(memorizeButtonAction:)
			  				forControlEvents:UIControlEventTouchDown];
		[_memorizeButton release];
		
		// Reset Button :
		_resetButton = [[UIButton alloc] init];
		[_resetButton setTitle:@"Reset" forState:UIControlStateNormal];
		[_resetButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
		[_resetButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[self addSubview:_resetButton];
		[_resetButton addTarget:self.subviews
							action:@selector(resetButtonAction:)
				  			forControlEvents:UIControlEventTouchDown];
		[_resetButton release];
		
		// Web Switch :
		_webSwitch = [[UISwitch alloc] init];
		[_webSwitch setOn:true];
		[self addSubview:_webSwitch];
		[_webSwitch addTarget:self.subviews
						action:@selector(webSwitchAction:)
			   			forControlEvents:UIControlEventValueChanged];
		[_webSwitch release];
		
		// Web Label :
		_webLabel = [[UILabel alloc] init];
		[_webLabel setText:@"web"];
		[_webLabel setTextColor:[UIColor cyanColor]];
		[_webLabel setTextAlignment:NSTextAlignmentLeft];
		[self addSubview:_webLabel];
		[_webLabel release];
	}
	return self;
}
	
- (void) drawInFormat:(CGSize)format {
	_device = [UIDevice currentDevice];
	CGFloat h = format.height;
	CGFloat w = format.width;
	
	CGFloat margine = 26;
	CGFloat rightMargine = w-(2*margine);
	CGFloat elemHeight = 28;
	CGFloat distance = 8;
	
	// Origin for each elements aligne with the left margine.
	CGFloat originY = margine;
	
	
	/* ******************** Portrait Orientation : ******************** */

	if (w < h || [_device userInterfaceIdiom] != UIUserInterfaceIdiomPhone) {
		
		/* ********** Buttons Zone : ********** */
		
		// Penultimate Label :
		[_penultimateLabel setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Penultimate Button :
		originY = _penultimateLabel.frame.origin.y + _penultimateLabel.frame.size.height + distance;
		[_penultimateButton setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Previous Label :
		originY = _penultimateButton.frame.origin.y + _penultimateButton.frame.size.height + distance;
		[_previousLabel setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Previous Button :
		originY = _previousLabel.frame.origin.y + _previousLabel.frame.size.height + distance;
		[_previousButton setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Current Label :
		originY = _previousButton.frame.origin.y + _previousButton.frame.size.height + distance;
		[_currentLabel setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Current Button :
		originY = _currentLabel.frame.origin.y + _currentLabel.frame.size.height + distance;
		
		if ([_device userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
			[_currentButton setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		} else {
			CGFloat adjustSize = h - (15 * elemHeight + 14 * distance + 2 * margine) ;
			[_currentButton setFrame:
			 CGRectMake(margine, originY, rightMargine, elemHeight + adjustSize)];
		}
		
		
		/* ********** Sliders Zone : ********** */
		
		// Red Label :
		originY = _currentButton.frame.origin.y + _currentButton.frame.size.height + distance;
		[_redLabel setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Red Slider :
		originY = _redLabel.frame.origin.y + _redLabel.frame.size.height + distance;
		[_redSlider setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Green Label :
		originY = _redSlider.frame.origin.y + _redSlider.frame.size.height + distance;
		[_greenLabel setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Green Slider :
		originY = _greenLabel.frame.origin.y + _greenLabel.frame.size.height + distance;
		[_greenSlider setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Blue Label :
		originY = _greenSlider.frame.origin.y + _greenSlider.frame.size.height + distance;
		[_blueLabel setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Blue Slider :
		originY = _blueLabel.frame.origin.y + _blueLabel.frame.size.height + distance;
		[_blueSlider setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		
		/* ********** Bottom Zone : ********** */
		
		// Memorize Button :
		originY = _blueSlider.frame.origin.y + _blueSlider.frame.size.height + distance;
		[_memorizeButton setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Reset Button :
		originY = _memorizeButton.frame.origin.y + _memorizeButton.frame.size.height + distance;
		[_resetButton setFrame:CGRectMake(margine, originY, rightMargine, elemHeight)];
		
		// Web Switch :
		int switchWidth = 50;
		int switchHeight = 30;
		int switchOriginY = h - (switchHeight + margine);
		[_webSwitch setFrame:CGRectMake(margine, switchOriginY, switchWidth, elemHeight)];
		
		// Web Label :
		int _webLabelOriginX = margine + switchWidth + distance;
		[_webLabel setFrame:CGRectMake(_webLabelOriginX, switchOriginY, rightMargine, elemHeight)];
	}
	else {
		w = format.width;
		CGFloat centralWeight = w / 2;
		CGFloat centralLeftMargine = centralWeight - (1.5 * margine);
		CGFloat centralRightMargine = centralWeight + (margine / 2);
		originY = self.safeAreaInsets.top;
		
		/* ********** Buttons Zone : ********** */
		
		// Penultimate Label :
		[_penultimateLabel setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Red Label :
		[_redLabel setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		// Penultimate Button :
		originY = _penultimateLabel.frame.origin.y + _penultimateLabel.frame.size.height + distance;
		[_penultimateButton setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Red Slider :
		[_redSlider setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		// Previous Label :
		originY = _penultimateButton.frame.origin.y + _penultimateButton.frame.size.height + distance;
		[_previousLabel setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Green Label :
		[_greenLabel setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		// Previous Button :
		originY = _previousLabel.frame.origin.y + _previousLabel.frame.size.height + distance;
		[_previousButton setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Green Slider :
		[_greenSlider setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		// Current Label :
		originY = _previousButton.frame.origin.y + _previousButton.frame.size.height + distance;
		[_currentLabel setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Blue Label :
		[_blueLabel setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		// Current Button :
		originY = _currentLabel.frame.origin.y + _currentLabel.frame.size.height + distance;
		[_currentButton setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Blue Slider :
		[_blueSlider setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		// Memorize Button :
		originY = _blueSlider.frame.origin.y + _blueSlider.frame.size.height + distance;
		[_memorizeButton setFrame:CGRectMake(margine, originY, centralLeftMargine, elemHeight)];
		
		// Reset Button :
		[_resetButton setFrame:CGRectMake(centralRightMargine, originY, centralLeftMargine, elemHeight)];
		
		
		/* ********** Bottom Zone : ********** */
		
		// Web Switch :
		int switchWidth = 50;
		int switchHeight = 30;
		int switchOriginY = h - (switchHeight + margine);
		[_webSwitch setFrame:CGRectMake(margine, switchOriginY, switchWidth, elemHeight)];
		
		// Web Label :
		int _webLabelOriginX = margine + switchWidth + distance;
		[_webLabel setFrame:CGRectMake(_webLabelOriginX, switchOriginY, rightMargine, elemHeight)];
	}
}
	
- (void) dealloc {
	[super dealloc];
}
	
@end
