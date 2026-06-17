package dao;

import Conexao.Conexao;

import javax.xml.transform.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClienteDAO {
    Conexao conn = new Conexao();
    public void salvar(String nome, String cpf, String email) throws SQLException {
        try {
            String sql =
                    "INSERT INTO cliente(nome, cpf, email) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setString(1, nome);
            ps.setString(2, cpf);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (Exception e){
            System.err.println("Erro: " + e.getMessage());
        }
    }

    public void consultar() throws SQLException{
        String sql=
                "SELECT * FROM cliente";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            System.out.println(
                    rs.getInt("id_cliente")
            );

            System.out.println(
                    rs.getString("nome")
            );
        }
    }

    public void atualizar(String nome, String cpf, String email, int id) throws SQLException{
        String sql=
                "UPDATE cliente SET nome = ?, cpf = ?, email = ? WHERE id_cliente = ?";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);

        ps.setString(1,email);
        ps.setInt(2,id);
        ps.executeUpdate();
    }

    public void excluir(int id) throws SQLException{
        String sql=
            "DELETE FROM cliente WHERE id_cliente = ?";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);

        ps.setInt(1,id);
        ps.executeUpdate();
    }

}
