#include <cstdio>
#include "ast.hpp"

extern int yyparse();
extern ASTNode* root;

int main(int argc, char** argv) {
    printf("Enter an expression:\n");
    if(yyparse() == 0) {  // parsing succeeded
        if(root) {
            printf("Abstract Syntax Tree (AST):\n");
            root->print();
            printf("\n");
        }
    } else {
        printf("Parsing failed.\n");
    }
    return 0;
}
