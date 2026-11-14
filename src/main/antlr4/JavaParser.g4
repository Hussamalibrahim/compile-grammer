parser grammar JavaParser;

options {
    tokenVocab = JavaLexer;
}

@header {
    package org.compiler.grammar;
}

compilationUnit
    : packageDeclaration? importDeclaration* typeDeclaration* EOF
    ;

packageDeclaration
    : PACKAGE qualifiedName SEMI
    ;

importDeclaration
    : IMPORT STATIC? qualifiedName (DOT MUL)? SEMI
    ;

qualifiedName
    : IDENTIFIER (DOT IDENTIFIER)*
    ;

typeDeclaration
    : annotation* modifier* classDeclaration | SEMI
    ;

classDeclaration
    : CLASS IDENTIFIER typeParameters?
      (EXTENDS typeType)?
      (IMPLEMENTS typeList)?
      classBody
    ;

classBody
    : LBRACE classBodyDeclaration* RBRACE
    ;

annotation
    : AT qualifiedName
    ;

modifier
    : PUBLIC
    | PRIVATE
    | PROTECTED
    | STATIC
    | ABSTRACT
    | FINAL
    | NATIVE
    | SYNCHRONIZED
    | TRANSIENT
    | VOLATILE
    ;

typeParameters
    : LT typeList GT
    ;

typeList
    : typeType (COMMA typeType)*
    ;

typeType
    : primitiveType (LBRACK RBRACK)*
    | qualifiedName (typeArguments)? (LBRACK RBRACK)*
    ;

typeArguments
    : LT typeList GT
    ;

primitiveType
    : BOOLEAN
    | BYTE
    | CHAR
    | SHORT
    | INT
    | LONG
    | FLOAT
    | DOUBLE
    ;

classBodyDeclaration
    : SEMI
    | annotation* modifier* memberDeclaration
    ;

memberDeclaration
    : fieldDeclaration
    | methodDeclaration
    | constructorDeclaration
    | classDeclaration
    ;

fieldDeclaration
    : typeType variableDeclarators SEMI
    ;

variableDeclarators
    : variableDeclarator (COMMA variableDeclarator)*
    ;

variableDeclarator
    : IDENTIFIER (ASSIGN expression)?
    ;

expression
    : assignmentExpression
    ;
methodDeclaration
    : (typeType | VOID) IDENTIFIER formalParameters methodBody
    ;
constructorDeclaration
    : IDENTIFIER formalParameters constructorBody
    ;
formalParameters
    : LPAREN formalParameterList? RPAREN
    ;
formalParameterList
    : formalParameter (COMMA formalParameter)*
    ;
formalParameter
    : typeType IDENTIFIER
    ;
methodBody
    : block
    ;
constructorBody
    : block
    ;

block
    : LBRACE blockStatement* RBRACE
    ;
blockStatement
    : localVariableDeclarationStatement
    | statement
    ;
localVariableDeclarationStatement
    : typeType variableDeclarators SEMI
    ;
statement
    : block
    | SEMI
    | expressionStatement
    | ifStatement
    | whileStatement
    | forStatement
    | returnStatement
    ;
expressionStatement
    : expression SEMI
    ;
ifStatement
    : IF LPAREN expression RPAREN statement
      (ELSE statement)?
    ;

whileStatement
    : WHILE LPAREN expression RPAREN statement
    ;
forStatement
    : FOR LPAREN forControl RPAREN statement
    ;
forControl
    : forInit? SEMI expression? SEMI forUpdate?
    ;
forInit
    : typeType variableDeclarators
    | expressionList
    ;
forUpdate
    : expressionList
    ;
expressionList
    : expression (COMMA expression)*
    ;

returnStatement
    : RETURN expression? SEMI
    ;

assignmentExpression
    : conditionalExpression
      (assignmentOperator assignmentExpression)?
    ;

assignmentOperator
    : ASSIGN
    | ADD_ASSIGN
    | SUB_ASSIGN
    | MUL_ASSIGN
    | DIV_ASSIGN
    | MOD_ASSIGN
    ;

conditionalExpression
    : logicalOrExpression
      (QUESTION expression COLON conditionalExpression)?
    ;

logicalOrExpression
    : logicalAndExpression (OR_OR logicalAndExpression)*
    ;

logicalAndExpression
    : equalityExpression (AND_AND equalityExpression)*
    ;

equalityExpression
    : relationalExpression
      ((EQUAL | NOT_EQUAL) relationalExpression)*
    ;

relationalExpression
    : additiveExpression
      ((LT | GT | LE | GE) additiveExpression)*
    ;

additiveExpression
    : multiplicativeExpression
      ((ADD | SUB) multiplicativeExpression)*
    ;

multiplicativeExpression
    : unaryExpression
      ((MUL | DIV | MOD) unaryExpression)*
    ;

unaryExpression
    : (NOT | SUB | INC | DEC) unaryExpression
    | postfixExpression
    ;

postfixExpression
    : primaryExpression (postfixPart)* (INC | DEC)?
    ;

postfixPart
    : DOT IDENTIFIER arguments?
    | arguments
    | LBRACK expression RBRACK
    ;

primaryExpression
    : literal
    | IDENTIFIER
    | THIS
    | SUPER
    | NEW typeType arguments
    | LPAREN expression RPAREN
    ;

arguments
    : LPAREN expressionList? RPAREN
    ;

literal
    : INTEGER_LITERAL
    | FLOAT_LITERAL
    | CHAR_LITERAL
    | STRING_LITERAL
    | TRUE
    | FALSE
    | NULL
    ;
