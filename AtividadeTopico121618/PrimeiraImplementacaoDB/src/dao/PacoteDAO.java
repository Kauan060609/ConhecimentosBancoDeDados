package dao;

import Conexao.Conexao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacoteDAO {


    Conexao conn = new Conexao();
    public void salvar(String destino, String quantidade_dias, int id_transporte, int id_hospedagem) throws SQLException {
        try {
            String sql =
                    "INSERT INTO pacote(destino, quantidade_dias, id_transporte,id_hospedagem) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setString(1, destino);
            ps.setString(2, quantidade_dias);
            ps.setDouble(3, id_transporte);
            ps.setDouble(4, id_hospedagem);

            ps.executeUpdate();
        } catch (Exception e){
            System.err.println("Erro: " + e.getMessage());
        }
    }

    public void consultar() throws SQLException{
        String sql=
                "SELECT * FROM pacote";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            System.out.println(
                    rs.getInt("id_pacote")
            );

            System.out.println(
                    rs.getString("destino")
            );
        }
    }

    public void atualizar(String destino, String quantidade_dias, int id_transporte, int id_hospedagem) throws SQLException{
        String sql=
                "UPDATE pacote SET destino = ?, quantidade_dias = ?, id_transporte = ?, id_hospedagem = ? WHERE id_pacote = ?";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);

        ps.setString(1,destino);
        ps.setString(2,quantidade_dias);
        ps.setInt(3,id_transporte);
        ps.setInt(4,id_hospedagem);
        ps.executeUpdate();
    }

    public void excluir(int id_pacote) throws SQLException{
        String sql=
                "DELETE FROM pacote WHERE id_pacote = ?";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);

        ps.setInt(1,id_pacote);
        ps.executeUpdate();
    }
}
