%{
 #include<stdio.h>
 #include<math.h>
%}
%union{
    int num;
    char operator;
}

%token<num> NUMBER
%token<num> left_bracket right_bracket
%token '/' '*' '+' '-'
%token EOL
%type<num> exp

%%
input:
|
    line input
;
line:
    exp EOL {printf("the result is = %d\n",$1);}
|   
    EOL
;

exp:
    NUMBER {$$=$1;}
|
    left_bracket exp right_bracket {$$ = $2 ;}
|
    exp left_bracket exp right_bracket {$$ = $1 * $3;}
|
    exp '/' NUMBER {$$= $1 / $3;}
|
    exp '*' NUMBER {$$ = $1 * $3;}
|
    exp '+' NUMBER{$$ = $1 + $3;}
|
    exp '-' NUMBER{$$ = $1 - $3; }
;

%%

int main(int argc, char* argv[])
{
    yyparse();

    return 0;
}

yyerror(char* s)
{
    printf("Unmatched input: %s\n", s);
    return 0;
}

