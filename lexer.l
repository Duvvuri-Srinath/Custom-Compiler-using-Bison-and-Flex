%{
#include "parser.tab.h"
#include <cstdlib>
#include <cstdio>
%}

%%

[ \t\n]+             ;  // Skip whitespace

[0-9]+               { yylval.ival = atoi(yytext); return NUMBER; }

"("                  { return LPAREN; }
")"                  { return RPAREN; }
"+"                  { return PLUS; }
"-"                  { return MINUS; }
"*"                  { return MUL; }
"/"                  { return DIV; }

.                    { 
                          fprintf(stderr, "Lexical Error: Unexpected character '%s'\n", yytext);
                          exit(1);
                      }

%%

int yywrap(void) {
    return 1;
}
