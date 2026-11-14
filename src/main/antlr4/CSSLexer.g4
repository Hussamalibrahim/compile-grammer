lexer grammar CSSLexer;

// Whitespace and comments
WS
    : [ \t\r\n\f]+ -> skip
    ;

COMMENT
    : '/*' .*? '*/' -> skip
    ;

// At-rules
AT_KEYWORD
    : '@' IDENT_START IDENT_CONTINUE*
    ;

// Punctuation
LBRACE    : '{';
RBRACE    : '}';
LBRACKET  : '[';
RBRACKET  : ']';
LPAREN    : '(';
RPAREN    : ')';
COLON     : ':';
SEMICOLON : ';';
COMMA     : ',';
DOT       : '.';
HASH      : '#' IDENT_CONTINUE+;
STAR      : '*';
PLUS      : '+';
MINUS     : '-';
GREATER   : '>';
TILDE     : '~';
PIPE      : '|';
SLASH     : '/';
BANG      : '!';

// Values
STRING
    : '"' ( '\\' . | ~["\\] )* '"'
    | '\'' ( '\\' . | ~['\\] )* '\''
    ;

DIMENSION
    : NUMBER_FRAGMENT IDENT_START IDENT_CONTINUE*
    ;

PERCENTAGE
    : NUMBER_FRAGMENT '%'
    ;

NUMBER
    : NUMBER_FRAGMENT
    ;

IDENT
    : '--'? IDENT_START IDENT_CONTINUE*
    ;

URL_BADGE
    : '...'
    ;

OTHER
    : .
    ;

fragment NUMBER_FRAGMENT
    : [+-]?
      (
          [0-9]+ ('.' [0-9]*)?
        | '.' [0-9]+
      )
      ([eE] [+-]? [0-9]+)?
    ;

fragment IDENT_START
    : [a-zA-Z_]
    | '\\' .
    ;

fragment IDENT_CONTINUE
    : IDENT_START
    | [0-9]
    | '-'
    ;
