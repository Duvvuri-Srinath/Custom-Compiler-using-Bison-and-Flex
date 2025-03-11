#ifndef AST_HPP
#define AST_HPP

#include <iostream>

// Base class for all AST nodes.
class ASTNode {
public:
    virtual ~ASTNode() {}
    virtual void print() const = 0; // For demonstration, we print the AST.
};

// Represents a numeric literal.
class NumberNode : public ASTNode {
public:
    int value;
    NumberNode(int val) : value(val) {}
    void print() const override {
        std::cout << value;
    }
};

// Represents a binary operation (e.g., +, -, *, /).
class BinaryOpNode : public ASTNode {
public:
    char op;
    ASTNode* left;
    ASTNode* right;
    BinaryOpNode(char oper, ASTNode* l, ASTNode* r) : op(oper), left(l), right(r) {}
    ~BinaryOpNode() {
        delete left;
        delete right;
    }
    void print() const override {
        std::cout << "(";
        left->print();
        std::cout << " " << op << " ";
        right->print();
        std::cout << ")";
    }
};

#endif // AST_HPP
