package org.compiler.grammar;

import org.antlr.v4.runtime.*;
import org.junit.jupiter.api.Test;

import java.nio.file.Path;

class ParserTest {

    @Test
    void testStudentParser() throws Exception {

        Path path = Path.of("src/main/java/org/compiler/grammar/Student.java");

        CharStream input = CharStreams.fromPath(path);

        org.compiler.grammar.JavaLexer lexer = new org.compiler.grammar.JavaLexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Print Tokens
        tokens.fill();

        System.out.println("========== TOKENS ==========");

        for (Token token : tokens.getTokens()) {
            System.out.printf(
                    "Type: %-25s Text: %s%n",
                    org.compiler.grammar.JavaLexer.VOCABULARY.getSymbolicName(token.getType()),
                    token.getText()
            );
        }

        // Parse
        tokens.seek(0);

        org.compiler.grammar.JavaParser parser = new org.compiler.grammar.JavaParser(tokens);

        parser.removeErrorListeners();
        parser.addErrorListener(new DiagnosticErrorListener());

        org.compiler.grammar.JavaParser.CompilationUnitContext tree =
                parser.compilationUnit();

        // Print Parse Tree
        System.out.println("========== PARSE TREE ==========");
        System.out.println(tree.toStringTree(parser));
    }
}
