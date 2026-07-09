package Conexao;

import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private static final String url = "jdbc:mysql://avnadmin:AVNS_8FXfQJe4CzKlgwh1jP5@mysql-14b97700-estudante-d3ec.g.aivencloud.com:13219/defaultdb?ssl-mode=REQUIRED";
    private static final String user = "avnadmin";
    private  static final String password = "AVNS_8FXfQJe4CzKlgwh1jP5";

    public static ConnectionFactory getConnection() throws RuntimeException {
        try{
            return (ConnectionFactory) DriverManager.getConnection(url,user,password);
        }catch (RuntimeException | SQLException erro){
            throw  new RuntimeException("Erro de Conexão!");
        }
    }

}
