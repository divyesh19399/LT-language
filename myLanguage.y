%{ 
#include<stdio.h>
#include<time.h>
int yylex(void);
void yyerror(char *);
struct tm *info;
%}

%token What is the current Time date day month year


%%
S: What is the current T 
T :Time {		printf("The time is: %02d:%02d:%02d\n", info->tm_hour,info->tm_min, info->tm_sec);
		}
	|date	{ printf("The date is: %02d/%02d/%02d\n", info->tm_mday,info->tm_mon+1, info->tm_year+1900);}
	| day	{ printf("The day of the week is: %02d and of the year is: %02d\n", info->tm_wday,info->tm_yday);}
    |month	{printf("The current month is :-%02d\n",info->tm_mon+1);}
    |year   {printf("The current year is:- %02d\n",info->tm_year+1900);};
%% 
void yyerror(char *s){}
int main(int argc,char *argv[])
{
	time_t t;
	time(&t);
	info = localtime(&t);
	printf("To know the current data and time!!!\n");
	printf("Weekdays are represented in the form of integer from 0(Sunday) to 6(Saturday)\n ");
	
	printf("TYPE AS FOLLOW:\n");
	printf("\"What is the current (Time|date|day|month|year)\" any one of them from the bracket\n");
	printf("For example:- for finding current year you have to write 'What is the current year'\n "); 
	yyparse();
	return 0;
	}
