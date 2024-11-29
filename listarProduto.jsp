<%@page import="dao.ProdutoDAO" %>
<%@page import="model.Produto" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listar Produtos</title>
    <link rel="stylesheet" href="WebContent/css/estilo.css">
</head>
<body>
    <h1>Lista de Produtos</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Categoria</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ProdutoDAO dao = new ProdutoDAO();
                List<Produto> produtos = dao.listarProdutos();
                for (Produto produto : produtos) {
            %>
            <tr>
                <td><%= produto.getId() %></td>
                <td><%= produto.getNome() %></td>
                <td><%= produto.getPreco() %></td>
                <td><%= produto.getQuantidade() %></td>
                <td><%= produto.getCategoria() %></td>
                <td><%= produto.getDescricao() %></td>
                <td>
                    <a href="editarProduto.jsp?id=<%= produto.getId() %>">Editar</a>
                    <a href="listarProduto.jsp?acao=excluir&id=<%= produto.getId()%>">Excluir</a>
                    
                </td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
        <a href="index.jsp">Voltar para Tela inicial</a>
    <% 
        if ("excluir".equals(request.getParameter("acao"))) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (dao.excluirProduto(id)) {
                out.println("<p style='color:green;'>Produto excluído com sucesso!</p>");
            } else {
                out.println("<p style='color:red;'>Erro ao excluir produto.</p>");
            }
        }
    %>
</body>
</html>
