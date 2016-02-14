//
//  ViewController.m
//  ActionSheet
//
//  Created by dev on 12/20/15.
//  Copyright © 2015 dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIPopoverController *userDataPopover;
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

- (IBAction)showActionNormalSheet:(id)sender {

    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle:@"What do you want to do with the file" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete it" otherButtonTitles:@"Copy",@"Move", @"Duplicate", nil ];
    
    actionSheet1.tag = 100;
    [actionSheet1 showInView:self.view];
}

- (IBAction)showDeleteConfirmation:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Really delete the selected contact?"
                                                             delegate:self
                                                    cancelButtonTitle:@"No, I changed my mind"
                                               destructiveButtonTitle:@"Yes, delete it"
                                                    otherButtonTitles:nil];
    actionSheet.tag = 200;
    
    [actionSheet showInView:self.view];
    //[actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
}

- (IBAction)showColorsActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Pick a color:"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Red", @"Green", @"Blue", @"Orange", @"Purple", nil];
    actionSheet.tag = 300;
    [actionSheet showInView:self.view];
 
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (actionSheet.tag == 100) {
//        NSLog(@"The Nomal action sheet. actionsheet.tag = %d, buttonIndex = %d",actionSheet.tag, buttonIndex);
//    }else if (actionSheet.tag == 200){
//        NSLog(@"The Delete Confirmation sction sheet. actionsheet.tag = %d, buttonIndex = %d",actionSheet.tag, buttonIndex);
//    }else{
//        NSLog(@"The Color Selection action Sheet. actionsheet.tag = %d, buttonIndex = %d",actionSheet.tag, buttonIndex);
//    }
//    NSLog(@"Index = %d - Title = %@", buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
    NSLog(@"%@  , buttonIndex = %d", actionSheet.title, buttonIndex);
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 300) {
        NSLog(@"From didDismissWithButtonIndex - Selected Color: %@", [actionSheet buttonTitleAtIndex:buttonIndex]);
    }
}

- (IBAction)showUserDataEntryForm:(id)sender {

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
    TestViewController *testViewController = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    self.userDataPopover.popoverContentSize = CGSizeMake(320.0, 400.0);
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    }
    
}

@end
