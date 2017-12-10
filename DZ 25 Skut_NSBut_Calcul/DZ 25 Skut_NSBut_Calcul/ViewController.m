//
//  ViewController.m
//  DZ 25 Skut_NSBut_Calcul
//
//  Created by mac on 09.12.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSString* resultString;
@property (strong, nonatomic) NSString* firstPart;
@property (strong, nonatomic) NSString* secondPart;
@property (assign, nonatomic) BOOL isOperation;
@property (assign, nonatomic) NSInteger numberOfOperation;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberOfOperation = 0;
    self.resultString = @"";
    self.firstPart = @"";
    self.secondPart = @"";
    self.isOperation = FALSE;
    
}

- (IBAction)numberOne:(UIButton *)sender {
    
    if (self.isOperation == TRUE) {
        
        self.secondPart = [self.secondPart stringByAppendingString:[NSString stringWithFormat:@"%ld", sender.tag]];
        
        self.resultString = [NSString stringWithString:self.firstPart];
        
        self.resultString = [self.resultString stringByAppendingString:[self operationIcon:self.numberOfOperation]];
        
        self.resultString = [self.resultString stringByAppendingString:self.secondPart];
        
        self.resultLabel.text = self.resultString;
        
    } else {
        
        self.resultString = [self.resultString stringByAppendingString:[NSString stringWithFormat:@"%ld", sender.tag]];
        
        self.resultLabel.text = self.resultString;
        
    }
    
}

- (IBAction)actionResetButton:(UIButton *)sender {
    
    self.resultLabel.text = @"0";
    self.resultString = @"";
    [self resetAll];
    
}

- (IBAction)actionAppendNumbers:(UIButton *)sender {
    
    if (self.isOperation == NO) {
        
        self.firstPart = [NSString stringWithString:self.resultString];
        self.resultString = [self.resultString stringByAppendingString:[self operationIcon:sender.tag]];
        self.resultLabel.text = [NSString stringWithString:self.resultString];
        self.numberOfOperation = sender.tag;
        self.isOperation = TRUE;
        
    }
}

- (IBAction)actionResultButton:(UIButton *)sender {
    
    CGFloat resultNumber = [self findResultBetweenNumber:[self.firstPart floatValue]
                                         andSecondNumber:[self.secondPart floatValue]
                                           withOperation:self.numberOfOperation];
    
    self.resultString = [NSString stringWithFormat:@"%.2f", resultNumber];
    
    self.resultLabel.text = [NSString stringWithString:self.resultString];
    
    [self resetAll];
    
}

- (IBAction)actionPointButton:(UIButton *)sender {
    
    self.resultString = [self.resultString stringByAppendingString:@"."];
    self.resultLabel.text = self.resultString;
    
}

- (IBAction)actionDeleteLastChar:(UIButton *)sender {
    
    if ([self.resultString length] > 0) {
        self.resultString = [self.resultString substringToIndex:[self.resultString length] - 1];
        self.resultLabel.text = self.resultString;
    } else {
        
        NSLog(@"NIT!");
        
    }
    
}

- (CGFloat) findResultBetweenNumber: (CGFloat) firstNumber andSecondNumber: (CGFloat) secondNumber withOperation: (NSInteger) operation {
    
    CGFloat resultNumber = 0;
    
    switch (operation) {
        case 0:
            resultNumber = firstNumber + secondNumber;
            break;
            
        case 1:
            resultNumber = firstNumber - secondNumber;
            break;
            
        case 2:
            resultNumber = firstNumber * secondNumber;
            break;
            
        case 3:
            resultNumber = firstNumber / secondNumber;
            break;
            
        default:
            break;
    }
    
    return resultNumber;
}

- (NSString*) operationIcon: (NSInteger) numberOfOperation {
    
    NSString* operationIcon = @"";
    
    switch (numberOfOperation) {
        case 0:
            operationIcon = @"+";
            break;
            
        case 1:
            operationIcon = @"-";
            break;
            
        case 2:
            operationIcon = @"*";
            break;
            
        case 3:
            operationIcon = @"/";
            break;
            
        default:
            break;
    }
    
    return operationIcon;
    
}

- (void) resetAll {
    
    self.firstPart = @"";
    self.secondPart = @"";
    self.numberOfOperation = 0;
    self.isOperation = FALSE;
    
}


@end
