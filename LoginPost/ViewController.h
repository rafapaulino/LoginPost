//
//  ViewController.h
//  LoginPost
//
//  Created by Rafael Brigagão Paulino on 05/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDataDelegate>

@property (nonatomic, weak) IBOutlet UITextField *campoNome;
@property (nonatomic, weak) IBOutlet UITextField *campoSenha;
@property (nonatomic, weak) IBOutlet UILabel *status;


-(IBAction)cadastrarUsuario:(id)sender;
-(IBAction)realizarLogin:(id)sender;

@end
