package br.edu.fatecpg.poo;
public class contatos {
    String nome;
    String telefone;
    String email;
    public contatos(String nome, String telefone, String email){
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;  
    }
    public String getNome(){
        return nome;
    }
    public String getTel(){
        return telefone;
    }
    public String getEmail(){
        return email;
    }   
}