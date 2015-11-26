package Main;

import java.sql.*;


public class start {

    public static void main(String[] args) {
        try {

            System.out.println("Iniciando...");
        	Main.Login Programa = new Main.Login();
            Programa.setVisible(true);

        } catch (Exception exceptionLaunched) {
            System.out.println("Menu Principal: " + exceptionLaunched.getMessage());
            exceptionLaunched.printStackTrace();
            System.exit(2);
        }
    }
}

