//
//  PhotoStackViewController.h
//
//  Created by Tom Longo
//  Edited by Daniel Larsson
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"

@interface PhotoStackViewController : UIViewController <PhotoStackViewDataSource, PhotoStackViewDelegate>

@property (nonatomic, strong) PhotoStackView *photoStack;

@end
