<%@page import="dao.ProdutoDAO" %>
<%@page import="model.Produto" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Produto</title>
    <link rel="stylesheet" href="WebContent/css/estilo.css">
</head>
<body>
    <h1>Editar Produto</h1>

    <% 
        // Recupera os parâmetros passados pela URL
        String idParam = request.getParameter("id");
        String nome = request.getParameter("nome");
        String preco = request.getParameter("preco");
        String quantidade = request.getParameter("quantidade");
        String categoria = request.getParameter("categoria");
        String descricao = request.getParameter("descricao");

        // Verifica se o parâmetro "id" foi fornecido
        if (idParam == null || idParam.isEmpty()) {
            out.println("<p style='color:red;'>ID do produto não fornecido.</p>");
        } else {
            try {
                // Converte o parâmetro id para inteiro
                int id = Integer.parseInt(idParam);

    %>

    <!-- Formulário para editar o produto -->
    <form action="editarProduto.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">

        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" value="<%= nome %>" required><br>

        <label for="preco">Preço:</label>
        <input type="number" name="preco" id="preco" value="<%= preco %>" step="0.01" required><br>

        <label for="quantidade">Quantidade:</label>
        <input type="number" name="quantidade" id="quantidade" value="<%= quantidade %>" required><br>

        <label for="categoria">Categoria:</label>
        <input type="text" name="categoria" id="categoria" value="<%= categoria %>" required><br>

        <label for="descricao">Descrição:</label>
        <textarea name="descricao" id="descricao" required><%= descricao %></textarea><br>

        <button type="submit">Salvar Alterações</button>
    </form>
    

    <% 
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>ID do produto inválido.</p>");
            }
        }

        // Quando o formulário for enviado (POST), faz a alteração no banco de dados
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nomeForm = request.getParameter("nome");
            double precoForm = Double.parseDouble(request.getParameter("preco"));
            int quantidadeForm = Integer.parseInt(request.getParameter("quantidade"));
            String categoriaForm = request.getParameter("categoria");
            String descricaoForm = request.getParameter("descricao");
            int idForm = Integer.parseInt(request.getParameter("id"));

            Produto produtoAtualizado = new Produto();
            produtoAtualizado.setId(idForm);
            produtoAtualizado.setNome(nomeForm);
            produtoAtualizado.setPreco(precoForm);
            produtoAtualizado.setQuantidade(quantidadeForm);
            produtoAtualizado.setCategoria(categoriaForm);
            produtoAtualizado.setDescricao(descricaoForm);

            ProdutoDAO dao = new ProdutoDAO();
            boolean atualizado = dao.alterarProduto(produtoAtualizado);

            // Exibe a mensagem de sucesso ou erro
            if (atualizado) {
                out.println("<p style='color:green;'>Produto atualizado com sucesso!</p>");
                out.println("<a href='index.jsp'>Voltar para o Menu Principal</a>");
            } else {
                out.println("<p style='color:red;'>Erro ao atualizar produto.</p>");
            }
        }
    %>
</body>
</html>
