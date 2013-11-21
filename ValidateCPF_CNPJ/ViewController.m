//
//  ViewController.m
//  ValidateCPF_CNPJ
//
//  Created by Flaviano on 20/11/13.
//  Copyright (c) 2013 Flaviano. All rights reserved.
//

#import "ViewController.h"
#import "Validate.h";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    //Test Validate CPF
    NSLog(@"%hhd", [Validate validateCPF:@"00000000"]);  //Invalid
    NSLog(@"%hhd", [Validate validateCPF:@"664.971.925-06"]);  //Valid
    NSLog(@"%hhd", [Validate validateCPF:@"14233418800"]);  //Valid
    NSLog(@"%hhd", [Validate validateCPF:@"441.333.779-40"]);  //Valid
    
    
    
    //Test Validate CNPJ    
    NSLog(@"%hhd", [Validate validateCNPJ:@"04.657.433/0001-75"]);  //Valid
    NSLog(@"%hhd", [Validate validateCNPJ:@"66.583.717/0001-11"]);  //Valid
    NSLog(@"%hhd", [Validate validateCNPJ:@"80140544000198"]);  //Valid
    NSLog(@"%hhd", [Validate validateCNPJ:@"04.657.433/0001-78"]);  //Invalid
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
