package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Produto;

public class ProdutoDAO {
    private Connection conexao;

    // Método para estabelecer a conexão com o banco de dados
    public void Conexao() {
        String nomebanco = "produto";
        String usuario = "root";
        String senha = "";
        String servidor = "localhost:3306";
        String nomedriver = "com.mysql.cj.jdbc.Driver";

        try {
            // Ativa o driver
            Class.forName(nomedriver);
            // Criação da conexão ao banco
            String url = "jdbc:mysql://" + servidor + "/" + nomebanco + "?useTimezone=true&serverTimezone=UTC";
            conexao = DriverManager.getConnection(url, usuario, senha);
        } catch (Exception e) {
            e.printStackTrace(); // Exibe o erro
        }
    }

    // Construtor que chama a conexão
    public ProdutoDAO() {
        Conexao(); // Garantir que a conexão seja estabelecida
    }

   
   
    //cadastra o produto
    public boolean cadastrarProduto(Produto produto) {
        try {
            PreparedStatement sql = conexao.prepareStatement(
                "INSERT INTO produto (nome, preco, quantidade, categoria, descricao) VALUES (?, ?, ?, ?, ?)");
            sql.setString(1, produto.getNome());
            sql.setDouble(2, produto.getPreco());
            sql.setInt(3, produto.getQuantidade());
            sql.setString(4, produto.getCategoria());
            sql.setString(5, produto.getDescricao());
            return sql.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    //apenas transforma o select em uma lista, onde posso fazer os tratamento de visualização no html junto com jsp
    public List<Produto> listarProdutos() {
        List<Produto> produtos = new ArrayList<>();
        //se a conexão não for valida, ele manda erro
        try {
            if (conexao == null) {
                throw new SQLException("A conexão com o banco de dados não foi estabelecida.");
            }

            String query = "SELECT * FROM produto";
            PreparedStatement stmt = conexao.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("pk_id"));
                produto.setNome(rs.getString("nome"));
                produto.setPreco(rs.getDouble("preco"));
                produto.setQuantidade(rs.getInt("quantidade"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setDescricao(rs.getString("descricao"));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Exibe o erro
        }
        return produtos;
    }
    //exclui o produto baseado no ID
    public boolean excluirProduto(int id) {
    try {
        String sql = "DELETE FROM produto WHERE pk_id = ?";
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, id);  // Passa o ID do produto a ser excluído
        return stmt.executeUpdate() > 0;  // Retorna true se a exclusão for bem-sucedida
    } catch (SQLException e) {
        e.printStackTrace(); // Exibe o erro
        return false;
    }
}

  public boolean alterarProduto(Produto produto) {
    try {
        // Verifica se a conexão foi estabelecida corretamente
        if (conexao == null) {
            throw new SQLException("A conexão com o banco de dados não foi estabelecida.");
        }

        // Consulta SQL para atualizar os dados do produto
        String query = "UPDATE produto SET nome = ?, preco = ?, quantidade = ?, categoria = ?, descricao = ? WHERE pk_id = ?";
        PreparedStatement stmt = conexao.prepareStatement(query);

        // Definindo os parâmetros da query
        stmt.setString(1, produto.getNome());
        stmt.setDouble(2, produto.getPreco());
        stmt.setInt(3, produto.getQuantidade());
        stmt.setString(4, produto.getCategoria());
        stmt.setString(5, produto.getDescricao());
        stmt.setInt(6, produto.getId());  // Atualiza com base no ID do produto

        // Verifica se a atualização foi bem-sucedida
        int rowsUpdated = stmt.executeUpdate();  // Retorna o número de linhas afetadas
        return rowsUpdated > 0;  // Se maior que 0, significa que a atualização foi bem-sucedida

    } catch (SQLException e) {
        e.printStackTrace();  // Exibe o erro se ocorrer
        return false;  // Caso contrário, retorna false indicando erro
    }
}
    

    
}
