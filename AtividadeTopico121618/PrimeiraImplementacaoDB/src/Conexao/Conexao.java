package Conexao;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private static final String URL =
            "jdbc:mysql://avnadmin:AVNS_NoqKb6iV5BXyCU8WUMS@mysql-2aa11331-estudante-6f0e.h.aivencloud.com:13933/PrimeiraImplementacao?ssl-mode=REQUIRED";

    private static final String USER =
            "avnadmin";

    private static final String PASSWORD =
            "AVNS_NoqKb6iV5BXyCU8WUMS";

    public static Connection conectar() {

        try {

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

        }catch (Exception e) {

            System.out.println(
                    "Erro na conexão"
            );
            System.out.println(e.getMessage());
            return null;
        }
    }
}