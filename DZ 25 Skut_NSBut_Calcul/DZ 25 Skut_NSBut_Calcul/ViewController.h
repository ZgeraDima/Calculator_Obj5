//
//  ViewController.h
//  DZ 25 Skut_NSBut_Calcul
//
//  Created by mac on 09.12.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)numberOne:(UIButton *)sender;
- (IBAction)actionResetButton:(UIButton *)sender;
- (IBAction)actionAppendNumbers:(UIButton *)sender;
- (IBAction)actionResultButton:(UIButton *)sender;
- (IBAction)actionPointButton:(UIButton *)sender;
- (IBAction)actionDeleteLastChar:(UIButton *)sender;



@end

