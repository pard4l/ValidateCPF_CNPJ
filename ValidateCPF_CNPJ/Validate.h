//
//  Validate.h
//  ValidateCPF_CNPJ
//
//  Created by Flaviano on 20/11/13.
//  Copyright (c) 2013 Flaviano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validate : NSObject

+ (BOOL) validateCPF:(NSString *)cpfNum;
+ (BOOL)validateCNPJ:(NSString *)cnpjNum;

@end
