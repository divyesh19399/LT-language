%{
#include <time.h>
#include<stdio.h>
#include "y.tab.h"
%}
SPACE	" "|"\t"|"\n"

%%


What {return What;}
is {return is;}
the		{return the;}
current	{return current;}
Time	{return Time;}
date	{return date;}
day		{return day;}
month	{return month;}
year	{return year;}
{SPACE}+  ;

.	yyerror("invalid character");
%%

int yywrap(void)
{
	return 1;
}
