import java.sql.Connection;

import conection.ConnectionSA;

public class Main {
    public static void main(String[] args){
        Connection conn = ConnectionSA.connect();
        if(conn != null){
            System.out.println("Conection OK");
        }else{
            System.out.println("Connection failed");
        }
    }
}