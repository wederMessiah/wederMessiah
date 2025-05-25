<%@page language="java" import="java.sql.*" %>
<%
    try {
        String nome = request.getParameter("txtnome");
        String senha = request.getParameter("txtsenha");
        String email = request.getParameter("txtemail");

        String banco = "cadastro";
        String endereco = "jdbc:mysql://localhost:3306/" + banco;
        String usuario = "root";
        String senhaDB = "";

        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);

        Connection conexao = DriverManager.getConnection(endereco, usuario, senhaDB);

        String sql = "INSERT INTO cadastro (nome, senha, email) VALUES (?, ?, ?)";
        PreparedStatement stm = conexao.prepareStatement(sql);

        stm.setString(1, nome);
        stm.setString(2, senha);
        stm.setString(3, email);

        stm.execute();
        stm.close();
        conexao.close();

        out.print("<h4>Cadastro criado com sucesso!</h4>");
        out.print("<a href='cadastro.html'>Ir para o login</a>");

    } catch (Exception e) {
        out.println("<h4>Erro ao criar conta: " + e.getMessage() + "</h4>");
        out.println("<a href='cadastro.html'>Voltar</a>");
    }
%>