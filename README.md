ValidateCPF_CNPJ
================

Functions to validate Brazilian CPF and CNPJ


HOW USE
=========

Import Class
#import "Validate.h";


CPF
==========
[Validate validateCPF:@"664.971.925-06"]); //Formated CPF
Return true or false

[Validate validateCPF:@"14233418800"]); //Clean CPF
Return true or false


CNPJ
==========
[Validate validateCNPJ:@"04.657.433/0001-75"]);  //Formated CNPJ
Return true or false
   
[Validate validateCNPJ:@"80140544000198"]);  //Clean CNPJ
Return true or false





