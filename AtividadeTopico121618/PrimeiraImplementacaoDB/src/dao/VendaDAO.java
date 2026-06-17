package dao;

import Conexao.Conexao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VendaDAO {

    Conexao conn = new Conexao();
    public void salvar(String data_venda, String forma_pagamento, double valor_total_dolar, int id_cliente, int id_pacote) throws SQLException {
        try {
            String sql =
                    "INSERT INTO venda(data_venda, forma_pagamento, valor_total_dolar,id_cliente,id_pacote ) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setString(1, data_venda);
            ps.setString(2, forma_pagamento);
            ps.setDouble(3, valor_total_dolar);
            ps.setDouble(4, id_cliente);
            ps.setDouble(5, id_pacote);

            ps.executeUpdate();
        } catch (Exception e){
            System.err.println("Erro: " + e.getMessage());
        }
    }

    public void consultar() throws SQLException{
        String sql=
                "SELECT * FROM venda";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            System.out.println(
                    rs.getInt("id_venda")
            );

            System.out.println(
                    rs.getString("data_venda")
            );
        }
    }

    public void atualizar(String data_venda, String forma_pagamento, Double valor_total_dolar, int id_venda) throws SQLException{
        String sql=
                "UPDATE venda SET data_venda = ?, forma_pagamento = ?, valor_total_dolar = ? WHERE id_venda = ?";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);

        ps.setString(1,data_venda);
        ps.setString(2,forma_pagamento);
        ps.setDouble(3,valor_total_dolar);
        ps.executeUpdate();
    }

    public void excluir(int id_venda) throws SQLException{
        String sql=
                "DELETE FROM venda WHERE id_venda = ?";
        PreparedStatement ps = conn.conectar().prepareStatement(sql);

        ps.setInt(1,id_venda);
        ps.executeUpdate();
    }
}
