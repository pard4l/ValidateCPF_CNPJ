//
//  Validate.m
//  ValidateCPF_CNPJ
//
//  Created by Flaviano on 20/11/13.
//  Copyright (c) 2013 Flaviano. All rights reserved.
//

#import "Validate.h"

@implementation Validate


+(BOOL) validateCPF:(NSString *)cpfNum
{
    
    cpfNum = [cpfNum stringByReplacingOccurrencesOfString:@"." withString:@""];
    cpfNum = [cpfNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    
    int cpf[cpfNum.length]; //define o valor com o tamanho da string
    int resultP = 0;
    int resultS = 0;
    NSString *caracter;
    if ( cpfNum.length != 11 ||
        [cpfNum isEqualToString:@"00000000000"] ||
        [cpfNum isEqualToString:@"11111111111"] ||
        [cpfNum isEqualToString:@"22222222222"] ||
        [cpfNum isEqualToString:@"33333333333"] ||
        [cpfNum isEqualToString:@"44444444444"] ||
        [cpfNum isEqualToString:@"55555555555"] ||
        [cpfNum isEqualToString:@"66666666666"] ||
        [cpfNum isEqualToString:@"77777777777"] ||
        [cpfNum isEqualToString:@"88888888888"] ||
        [cpfNum isEqualToString:@"99999999999"])
    {
        return false;
    }
    else {
        //converte a string para um array de integer
        for (int i = 0; i < cpfNum.length ; i++) {
            //[cpfNum substringWithRange:NSMakeRange(i, i+1)];
            //cpf[i] = Integer.parseInt(cpfNum.substring(i, i + 1));
            caracter = [NSString stringWithFormat:@"%C",[cpfNum characterAtIndex:i]];
            cpf[i] = [caracter intValue];
        }
        //calcula o primeiro número(DIV) do cpf
        for (int i = 0; i < 10; i++) {
            if (i==9) break;
            resultP += cpf[i] * (10 - i);
        }
        int divP = resultP % 11;
        
        if (divP < 2 || divP == 10 || divP == 11){
            divP = 0;
        } else {
            divP = 11 - divP;
        }
        //se o resultado for diferente ao 10º digito do cpf retorna falso
        if (divP != cpf[9]) {
            
            return false;
        } else {
            //calcula o segundo número(DIV) do cpf
            for (int i = 0; i < 11; i++) {
                if (i==10) break;
                resultS += cpf[i] * (11 - i);
            }
            int divS = resultS % 11;
            //se o resultado for diferente ao 11º digito do cpf retorna falso
            if (divS < 2 || divS == 10 || divS == 11){
                divS = 0;
            } else {
                divS = 11 - divS;
            }
            if (divS != cpf[10]) {
                return false;
            }
        }
        //se tudo estiver ok retorna verdadeiro
        return true;
    }
}

+ (BOOL)validateCNPJ:(NSString *)cnpjNum
{
    
    cnpjNum = [cnpjNum stringByReplacingOccurrencesOfString:@"." withString:@""];
    cnpjNum = [cnpjNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    cnpjNum = [cnpjNum stringByReplacingOccurrencesOfString:@"/" withString:@""];
 
    
    // considera-se erro CNPJ's formados por uma sequencia de numeros iguais
    if ([cnpjNum isEqualToString:@"00000000000000"] || [cnpjNum isEqualToString:@"11111111111111"]
        || [cnpjNum isEqualToString:@"22222222222222"] || [cnpjNum isEqualToString:@"33333333333333"]
        || [cnpjNum isEqualToString:@"44444444444444"] || [cnpjNum isEqualToString:@"55555555555555"]
        || [cnpjNum isEqualToString:@"66666666666666"] || [cnpjNum isEqualToString:@"77777777777777"]
        || [cnpjNum isEqualToString:@"88888888888888"] || [cnpjNum isEqualToString:@"99999999999999"]
        || [cnpjNum length]!= 14)
        return NO;
    
    char dig13, dig14;
    int sm, i, r, num, peso;
    
    // Calculo do 1o. Digito Verificador
    sm = 0;
    peso = 2;
    for (i=11; i>=0; i--) {
        // converte o i-ésimo caractere do CNPJ em um número:
        // por exemplo, transforma o caractere '0' no inteiro 0
        // (48 eh a posição de '0' na tabela ASCII)
        num = (int)([cnpjNum characterAtIndex:i] - 48);
        sm = sm + (num * peso);
        peso = peso + 1;
        if (peso == 10)
            peso = 2;
    }
    
    r = sm % 11;
    if ((r == 0) || (r == 1))
        dig13 = '0';
    else dig13 = (char)((11-r) + 48);
    
    // Calculo do 2o. Digito Verificador
    sm = 0;
    peso = 2;
    for (i=12; i>=0; i--) {
        num = (int)([cnpjNum characterAtIndex:i] - 48);
        sm = sm + (num * peso);
        peso = peso + 1;
        if (peso == 10)
            peso = 2;
    }
    
    r = sm % 11;
    if ((r == 0) || (r == 1))
        dig14 = '0';
    else dig14 = (char)((11-r) + 48);
    
    // Verifica se os dígitos calculados conferem com os dígitos informados.
    if ((dig13 == [cnpjNum characterAtIndex:12]) && (dig14 == [cnpjNum characterAtIndex:13]))
        return YES;
    else return NO;
}


@end
