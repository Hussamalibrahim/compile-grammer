lexer grammar JavaLexer;

@header {
    package org.compiler.grammar;
}

// KEYWORDS
PACKAGE     : 'package';
IMPORT      : 'import';
STATIC      : 'static';

CLASS       : 'class';
EXTENDS     : 'extends';
IMPLEMENTS  : 'implements';

PUBLIC      : 'public';
PRIVATE     : 'private';
PROTECTED   : 'protected';
ABSTRACT    : 'abstract';
FINAL       : 'final';
NATIVE      : 'native';
SYNCHRONIZED: 'synchronized';
TRANSIENT   : 'transient';
VOLATILE    : 'volatile';

VOID        : 'void';

INT         : 'int';
LONG        : 'long';
DOUBLE      : 'double';
FLOAT       : 'float';
BOOLEAN     : 'boolean';
CHAR        : 'char';
BYTE        : 'byte';
SHORT       : 'short';

IF          : 'if';
ELSE        : 'else';
FOR         : 'for';
WHILE       : 'while';
DO          : 'do';

RETURN      : 'return';
BREAK       : 'break';
CONTINUE    : 'continue';
THROW       : 'throw';
THROWS      : 'throws';

NEW         : 'new';
THIS        : 'this';
SUPER       : 'super';
INSTANCEOF  : 'instanceof';

TRUE        : 'true';
FALSE       : 'false';
NULL        : 'null';

// SEPARATORS
LPAREN      : '(';
RPAREN      : ')';

LBRACE      : '{';
RBRACE      : '}';

LBRACK      : '[';
RBRACK      : ']';

SEMI        : ';';
COMMA       : ',';
DOT         : '.';

AT          : '@';
COLON       : ':';
QUESTION    : '?';

// OPERATORS
// Longer operators are defined before shorter ones
ADD_ASSIGN  : '+=';
SUB_ASSIGN  : '-=';
MUL_ASSIGN  : '*=';
DIV_ASSIGN  : '/=';
MOD_ASSIGN  : '%=';

EQUAL       : '==';
NOT_EQUAL   : '!=';

LE          : '<=';
GE          : '>=';

AND_AND     : '&&';
OR_OR       : '||';

INC         : '++';
DEC         : '--';

ADD         : '+';
SUB         : '-';
MUL         : '*';
DIV         : '/';
MOD         : '%';

ASSIGN      : '=';
LT          : '<';
GT          : '>';

NOT         : '!';
AND         : '&';
OR          : '|';
XOR         : '^';

// LITERALS
INTEGER_LITERAL
    : '0' [xX] HEX_DIGIT+
    | '0' [bB] [01]+
    | DIGIT+
    ;

FLOAT_LITERAL
    : DIGIT+ '.' DIGIT* ([eE] [+-]? DIGIT+)? [fFdD]?
    | '.' DIGIT+ ([eE] [+-]? DIGIT+)? [fFdD]?
    | DIGIT+ [eE] [+-]? DIGIT+ [fFdD]?
    | DIGIT+ [fFdD]
    ;

CHAR_LITERAL
    : '\'' (~['\\\r\n] | '\\' .) '\''
    ;

STRING_LITERAL
    : '"' (~["\\\r\n] | '\\' .)* '"'
    ;

// IDENTIFIER
IDENTIFIER
    : JAVA_LETTER JAVA_LETTER_OR_DIGIT*
    ;

// COMMENTS AND WHITESPACE
LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;

BLOCK_COMMENT
    : '/*' .*? '*/' -> skip
    ;

WS
    : [ \t\r\n\f]+ -> skip
    ;

// FRAGMENTS
fragment DIGIT
    : [0-9]
    ;

fragment HEX_DIGIT
    : [0-9a-fA-F]
    ;

fragment JAVA_LETTER
    : [a-zA-Z_$]
    ;

fragment JAVA_LETTER_OR_DIGIT
    : [a-zA-Z0-9_$]
    ;