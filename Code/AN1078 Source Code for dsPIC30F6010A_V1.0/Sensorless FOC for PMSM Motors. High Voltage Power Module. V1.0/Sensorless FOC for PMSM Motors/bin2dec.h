#ifndef bin2dec_H
#define bin2dec_H

void adc2dec( unsigned int ADRES );
void bin2dec( unsigned long int ADRES );

//Provide the following variables global scope
EXTERN char adones;
EXTERN char adtenths;
EXTERN char adhundredths;
EXTERN char adthousandths;

EXTERN char tenthous ;
EXTERN char thousands ;					
EXTERN char hundreds ;
EXTERN char tens ;
EXTERN char ones ;

#endif
