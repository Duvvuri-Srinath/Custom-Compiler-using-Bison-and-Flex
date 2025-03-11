%{
#include <cstdio>
#include <cstdlib>
#include <typeinfo>
#include "ast.hpp"

extern int yylex();
void yyerror(const char *s);

// Global pointer to the root of the AST.
ASTNode* root;
%}

%union {
    int ival;
    char* sval;
    ASTNode* node;
}

%token <ival> NUMBER
%token PLUS MINUS MUL DIV
%token LPAREN RPAREN

%type <node> expression

%left PLUS MINUS
%left MUL DIV

%%
input:
    expression { root = $1; }
;

expression:
      NUMBER {
          $$ = new NumberNode($1);
      }
    | expression PLUS expression {
          $$ = new BinaryOpNode('+', $1, $3);
      }
    | expression MINUS expression {
          $$ = new BinaryOpNode('-', $1, $3);
      }
    | expression MUL expression {
          $$ = new BinaryOpNode('*', $1, $3);
      }
    | expression DIV expression {
          // Check for division by constant zero.
          NumberNode* num = dynamic_cast<NumberNode*>($3);
          if(num && num->value == 0) {
              yyerror("Division by zero detected");
              $$ = $1; // Error recovery: return left-hand side.
          } else {
              $$ = new BinaryOpNode('/', $1, $3);
          }
      }
    | LPAREN expression RPAREN {
          $$ = $2;
      }
;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}
