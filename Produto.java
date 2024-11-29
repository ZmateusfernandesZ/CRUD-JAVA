package model;

public class Produto {
    
    private int id;
    private String nome;
    private double preco;
    private int quantidade;
    private String categoria;
    private String descricao;
    
    //construtores
    public Produto() {
    }

    public Produto(int id, String nome, double preco, int quantidade) {
        this.id = id;
        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;
    }
    //getters e setters

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    

    public int getId() {
        return this.id;
    }

    public String getNome() {
        return this.nome;
    }

    public double getPreco() {
        return this.preco;
    }

    public int getQuantidade() {
        return this.quantidade;
    }

    public String getCategoria() {
        return this.categoria;
    }

    public String getDescricao() {
        return this.descricao;
    }

    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
