parser grammar HTMLParser;

options {
    tokenVocab = HTMLLexer;
}

document
    : DOCTYPE? node* EOF
    ;

node
    : element
    | HTML_TEXT
    ;

element
    : OPEN_TAG TAG_NAME attribute*
      (
          TAG_SLASH_CLOSE
        | TAG_CLOSE node* (CLOSE_TAG_OPEN TAG_NAME TAG_CLOSE)?
      )
    ;

attribute
    : TAG_NAME (TAG_EQUALS (TAG_STRING | TAG_NAME))?
    ;
