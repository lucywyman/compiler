/*
* Simple Infix Notation Calculator
* Lucy Wyman
* 
* Formal Grammar:
*   Expression  = IntExpr Operator IntExpr
*
*   Operator = + | - | * | /
*
*   IntExpr = Expression | Integer
*
*   Integer = [0-9]    
*/
#include<stdio.h>
#include<stdlib.h>

#define     maxLineLength   128

typdef enum Operator{
    ADD,
    SUBTRACT,
    MULTIPLY,
    DIVIDE,
    EOL
} Operator;

struct Token{
    Operator op;
    int integer;
}

char* scan(char* raw){

}

int main(int argc, char argv[]){
    int result;
    size_t len = 0;
    ssize_t read;
    char* raw = NULL;

    fp = fdopen(0, "r");
    if (fp == NULL) 
        exit(EXIT_FAILURE);
    printf("> ");

    while((read = getline(&raw, &len, fp)) != -1){
        raw[read-1] = '\0';
        scan(raw);
        printf(">");
    }

    free(raw);
    return 0;
}

