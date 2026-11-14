lexer grammar HTMLLexer;

// HTML comments and declarations
HTML_COMMENT
    : '<!--' .*? '-->' -> skip
    ;

DOCTYPE
    : '<!' [dD][oO][cC][tT][yY][pP][eE] .*? '>'
    ;

HTML_DECLARATION
    : '<!' .*? '>' -> skip
    ;

PROCESSING_INSTRUCTION
    : '<?' .*? '?>' -> skip
    ;

// Enter tag mode
CLOSE_TAG_OPEN
    : '</' -> pushMode(TAG)
    ;

OPEN_TAG
    : '<' -> pushMode(TAG)
    ;

// Text between tags. Thymeleaf inline expressions remain part of text.
HTML_TEXT
    : ~[<]+
    ;

mode TAG;

TAG_CLOSE
    : '>' -> popMode
    ;

TAG_SLASH_CLOSE
    : '/>' -> popMode
    ;

TAG_EQUALS
    : '='
    ;

TAG_STRING
    : '"' ~["]* '"'
    | '\'' ~[']* '\''
    ;

// Tag and attribute names. Attribute values without quotes are also
// tokenized as TAG_NAME after TAG_EQUALS.
TAG_NAME
    : [a-zA-Z_:] [a-zA-Z0-9_:.-]*
    ;

TAG_WS
    : [ \t\r\n\f]+ -> skip
    ;
