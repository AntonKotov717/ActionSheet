//
//  ViewController.h
//  ActionSheet
//
//  Created by dev on 12/20/15.
//  Copyright © 2015 dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestViewController.h"

@interface ViewController : UIViewController<UIActionSheetDelegate,TestViewControllerDelegate>

- (IBAction)showActionNormalSheet:(id)sender;
- (IBAction)showDeleteConfirmation:(id)sender;
- (IBAction)showColorsActionSheet:(id)sender;
- (IBAction)showUserDataEntryForm:(id)sender;

@end

