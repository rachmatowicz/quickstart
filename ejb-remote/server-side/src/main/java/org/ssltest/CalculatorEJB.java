package org.ssltest;

public class CalculatorEJB implements Calculator {
    float interest = 5;
    @Override
    public float calculateInterest(long money) {
        return money * (1 + (interest/100));
    }
}
