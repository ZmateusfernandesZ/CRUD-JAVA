<%@page import="model.Produto" %>
<%@page import="dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Produto</title>
    <link rel="stylesheet" href="WebContent/css/estilo.css">
</head>
<body>
    <h1>Cadastrar Novo Produto</h1>
    <form action="cadastrarProduto.jsp" method="post">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" required><br>

        <label for="preco">Preço:</label>
        <input type="number" name="preco" id="preco" step="0.01" required><br>

        <label for="quantidade">Quantidade:</label>
        <input type="number" name="quantidade" id="quantidade" required><br>

        <label for="categoria">Categoria:</label>
        <input type="text" name="categoria" id="categoria" required><br>

        <label for="descricao">Descrição:</label>
        <textarea name="descricao" id="descricao" required></textarea><br>

        <button type="submit">Cadastrar</button>
    </form>
    <a href="index.jsp">Voltar para Lista de Produtos</a>

    <% 
        // Lógica para processar o formulário
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nome = request.getParameter("nome");
            double preco = Double.parseDouble(request.getParameter("preco"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            String categoria = request.getParameter("categoria");
            String descricao = request.getParameter("descricao");

            Produto produto = new Produto();
            produto.setNome(nome);
            produto.setPreco(preco);
            produto.setQuantidade(quantidade);
            produto.setCategoria(categoria);
            produto.setDescricao(descricao);

            ProdutoDAO dao = new ProdutoDAO();
            if (dao.cadastrarProduto(produto)) {
                out.println("<p style='color:green;'>Produto cadastrado com sucesso!</p>");
            } else {
                out.println("<p style='color:red;'>Erro ao cadastrar produto.</p>");
            }
        }
    %>
</body>
</html>
