package org.ssltest;

import jakarta.ejb.Remote;

@Remote
public interface Calculator {
    float calculateInterest(long money);
}
