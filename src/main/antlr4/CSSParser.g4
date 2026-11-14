parser grammar CSSParser;

options {
    tokenVocab = CSSLexer;
}

stylesheet
    : rule* EOF
    ;

rule
    : qualifiedRule
    | atRule
    ;

qualifiedRule
    : selectorList declarationBlock
    ;

selectorList
    : selector (COMMA selector)*
    ;

selector
    : selectorPart+
    ;

selectorPart
    : IDENT
    | HASH
    | STAR
    | DOT IDENT
    | COLON COLON? IDENT
    | LBRACKET selectorAttributeToken* RBRACKET
    | GREATER
    | PLUS
    | TILDE
    | PIPE
    | OTHER
    ;

selectorAttributeToken
    : IDENT
    | STRING
    | NUMBER
    | DIMENSION
    | PERCENTAGE
    | HASH
    | COLON
    | STAR
    | PLUS
    | MINUS
    | TILDE
    | PIPE
    | OTHER
    ;

declarationBlock
    : LBRACE declaration* RBRACE
    ;

declaration
    : IDENT COLON value BANG? IDENT? SEMICOLON
    | IDENT COLON value SEMICOLON?
    ;

value
    : componentValue+
    ;

componentValue
    : IDENT
    | STRING
    | NUMBER
    | DIMENSION
    | PERCENTAGE
    | HASH
    | COMMA
    | SLASH
    | PLUS
    | MINUS
    | STAR
    | DOT
    | COLON
    | OTHER
    | function
    | parenthesized
    ;

function
    : IDENT LPAREN componentValue* RPAREN
    ;

parenthesized
    : LPAREN componentValue* RPAREN
    ;

atRule
    : AT_KEYWORD componentValue*
      (SEMICOLON | declarationBlock)?
    ;
