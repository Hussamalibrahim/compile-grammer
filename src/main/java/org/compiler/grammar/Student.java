package org.compiler.grammar;

import java.util.List;

public class Student {
    private String name;
    private int age = 20;

    public Student(String name) {
        this.name = name;
    }

    public boolean isAdult() {
        if (age >= 18) {
            return true;
        } else {
            return false;
        }
    }

    public int sumTo(int n) {
        int total = 0;

        for (int i = 1; i <= n; i++) {
            total += i;
        }

        return total;
    }
}