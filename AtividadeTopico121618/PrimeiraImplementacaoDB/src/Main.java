import java.sql.Connection;
import Conexao.Conexao;

public class Main {

    public static void main(String[]args) {

        Connection conn = Conexao.conectar();

        if(conn!=null){

            System.out.println(
                    "Conectado com sucesso!"
            );

        }else {

            System.out.println(
                    "Falha na conexão"
            );
        }
    }
}