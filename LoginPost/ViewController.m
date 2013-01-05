//
//  ViewController.m
//  LoginPost
//
//  Created by Rafael Brigagão Paulino on 05/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *dadosRecebidos;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark acoes dos botoes

-(IBAction)cadastrarUsuario:(id)sender
{
    if (_campoSenha.text.length > 0 && _campoNome.text.length > 0)
    {
        //ok posso cadastrar
        NSURL *url = [NSURL URLWithString:@"http://fernandopastor.sitepessoal.com/aula/cadastrar.php"];
        
        NSMutableURLRequest *requisicao = [NSMutableURLRequest requestWithURL:url];
        
        [requisicao setHTTPMethod:@"POST"];
        
        NSString *parametrosCadastro = [NSString stringWithFormat:@"usuario=%@&senha=%@", _campoNome.text,_campoSenha.text];
        
        NSData *corpoRequisicao = [parametrosCadastro dataUsingEncoding:NSUTF8StringEncoding];
        
        [requisicao setHTTPBody:corpoRequisicao];
        
        [NSURLConnection connectionWithRequest:requisicao delegate:self];
                
        
    }
    else
    {
        //problemas campos em branco
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"Campos nao podem estar em branco!" delegate:nil cancelButtonTitle:@"Fechar" otherButtonTitles:nil] show];
    }
    
    [_campoNome resignFirstResponder];
    [_campoSenha resignFirstResponder];
}

-(IBAction)realizarLogin:(id)sender
{
    if (_campoSenha.text.length > 0 && _campoNome.text.length > 0)
    {
        //ok posso cadastrar
        NSURL *url = [NSURL URLWithString:@"http://fernandopastor.sitepessoal.com/aula/login.php"];
        
        NSMutableURLRequest *requisicao = [NSMutableURLRequest requestWithURL:url];
        
        [requisicao setHTTPMethod:@"POST"];
        
        NSString *parametrosCadastro = [NSString stringWithFormat:@"usuario=%@&senha=%@", _campoNome.text,_campoSenha.text];
        
        NSData *corpoRequisicao = [parametrosCadastro dataUsingEncoding:NSUTF8StringEncoding];
        
        [requisicao setHTTPBody:corpoRequisicao];
        
        [NSURLConnection connectionWithRequest:requisicao delegate:self];
        
        
    }
    else
    {
        //problemas campos em branco
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"Campos nao podem estar em branco!" delegate:nil cancelButtonTitle:@"Fechar" otherButtonTitles:nil] show];
    }
    
    [_campoNome resignFirstResponder];
    [_campoSenha resignFirstResponder];
}

#pragma mark delegates url

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    dadosRecebidos = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        [dadosRecebidos appendData:data];
    }
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //exibir info na label
    _status.text = [[NSString alloc] initWithData:dadosRecebidos encoding:NSUTF8StringEncoding];
}


@end
