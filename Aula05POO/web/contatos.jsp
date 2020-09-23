<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="br.edu.fatecpg.poo.contatos"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<contatos> lstCdstr = (ArrayList) application.getAttribute("Cdstr1");
    if(lstCdstr == null){
        lstCdstr = new ArrayList<contatos>();
        application.setAttribute("lstCdstr", lstCdstr);
    }
    if(request.getParameter("add") != null){
        String nome = request.getParameter("nome");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        lstCdstr.add(new contatos(nome, tel, email));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("remove") != null){
        int i = Integer.parseInt(request.getParameter("i"));
        lstCdstr.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de contatos</title>
    </head>
    <body>
        <form method="post" align="center">
            Nome: <input type="text" name="nome"/>
            Telefone: <input type="text" name="tel" required/>
            Email: <input type="text" name="email" required/>
            <input type="submit" name="add" value="Adicionar contato" required/>
        </form>
        <hr/>
        <table border="1" align="center">
            <tr>
                <thead>
                <th>Contato</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Comando</th>
                <thead/>
                <%for(int i=0; i<lstCdstr.size(); i++){%>
                <% contatos novocontato = lstCdstr.get(i);%>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= novocontato.getNome() %></td>
                        <td><%= novocontato.getTel() %></td>
                        <td><%= novocontato.getEmail() %></td>
                        <td>
                            <form>
                                <input type="submit" name="remove" value="Remover"/>
                                <input type="hidden" name="i" value="<%= i %>">
                            </form>
                        </td>
                    </tr>
                <%}%>
            </tr>
        </table>
        <hr/>
        <h4 align="center"><a href="index.jsp">Página Inicial</a></h4>
    </body>
</html>
