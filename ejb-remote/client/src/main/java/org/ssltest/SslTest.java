package org.ssltest;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Hashtable;

public class SslTest {
    public static void main(String[] args) throws Exception {
        Calculator calculator = lookupCalculatorEJB();
        final long amount = 1000L;
        System.out.println("Calculating interest on " + amount);
        float total = calculator.calculateInterest(amount);
        System.out.println("Final amount = " + total);
    }

    private static Calculator lookupCalculatorEJB() throws NamingException {
        final Hashtable<String, String> jndiProperties = new Hashtable<>();
        jndiProperties.put(Context.INITIAL_CONTEXT_FACTORY, "org.wildfly.naming.client.WildFlyInitialContextFactory");
        final Context context = new InitialContext(jndiProperties);

        return (Calculator) context.lookup("ejb:/ejb-remote-server-side-debug/CalculatorEJB!org.ssltest.Calculator");
    }
}
