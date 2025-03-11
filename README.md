# **Custom Compiler using Bison and Flex**  

This project is a simple compiler built using **Bison** and **Flex**, capable of performing **lexical analysis**, **syntax analysis**, and **AST (Abstract Syntax Tree) generation** for arithmetic expressions. It includes error handling mechanisms for **syntax errors**, **division by zero detection**, and **unexpected characters**.

## **Features**
- **Lexical Analysis**: Tokenizes input expressions using Flex.  
- **Syntax Analysis**: Parses arithmetic expressions using Bison.  
- **Abstract Syntax Tree (AST) Generation**: Builds an AST representation of expressions.  
- **Error Handling**: Reports unexpected characters, syntax errors, and division by zero.  
- **LALR(1) Parsing**: Implements efficient bottom-up parsing using Bison.  

## **Technologies Used**
- **Bison** - Syntax analysis (Parsing)  
- **Flex** - Lexical analysis (Tokenizing input)  
- **C++** - Compiler implementation  
- **Git** - Version control  

## **Getting Started**

### **Prerequisites**
Ensure you have the following installed on your system:  
- **Flex** (`lex`)  
- **Bison** (`yacc`)  
- **G++** (`g++`)  

To check if they are installed, run:  
```bash
flex --version
bison --version
g++ --version
```

### Installation & Compilation

### 1. Clone the Repository
``` bash
git clone https://github.com/yourusername/custom-compiler.git
cd custom-compiler
```
### 2. Compile the Compiler
``` bash
bison -d parser.y        # Generate parser.tab.c and parser.tab.h
flex lexer.l             # Generate lex.yy.c
g++ -o compiler main.cpp parser.tab.c lex.yy.c -lfl  # Compile everything
```
### 3. Run the Compiler
``` bash
./compiler
```
### Usage
- Enter an arithmetic expression (e.g., 3 + 5 * (2 - 8)).
- The program will parse the expression and print the generated Abstract Syntax Tree (AST).
- If there are errors (syntax issues, unexpected characters, division by zero), meaningful error messages will be displayed.

### Example Run
``` bash
$ ./compiler
Enter an expression:
3 + 5 * (2 - 8)

Abstract Syntax Tree (AST):
(3 + (5 * (2 - 8)))
```
### Error Handling
- Add support for variables and assignments
- Extend to more complex expressions (functions, conditionals, loops, etc.)
- Generate executable code from AST

### License
This project is open-source under the MIT License.

### Author
Developed by Srinath Duvvuri.
