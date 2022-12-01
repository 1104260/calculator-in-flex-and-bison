%{
    #include"calculator.tab.h"
%}

%%
-?[0-9]+ {yylval.num = atoi(yytext); return NUMBER;}
-?[0-9]+\.[0-9]+ {yylval.num = atoi(yytext); return NUMBER;}

"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return left_bracket;}
")" {return right_bracket;}
\n {return EOL;}
. {}

%%

yywrap(){}