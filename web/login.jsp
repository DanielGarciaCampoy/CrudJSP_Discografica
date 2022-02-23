<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD Discografica - Inicio de Sesión</title>
    </head>
    <body class="bg-dark">            
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/discografica","root", "");
            Statement s = conexion.createStatement();
                
            request.setCharacterEncoding("UTF-8");
                
            Statement u = conexion.createStatement();
            ResultSet listado = s.executeQuery("SELECT * FROM usuario");
            boolean correcto = false;
            while (listado.next()) {
                if (request.getParameter("usuario").toString().equals(listado.getString("usuario")) && request.getParameter("contrasenia").toString().equals(listado.getString("contrasenia"))) {
                    correcto = true;
                    String name = request.getParameter("usuario");
                    ResultSet miDiscog = u.executeQuery("SELECT * FROM usuario");
                    miDiscog.next();
                    response.sendRedirect("listarAlbum.jsp");
                }
            }
            
            if (!correcto) { // si el usuario o la contrasenia son erroneas, error="Usuario o contraseña incorrectos, por favor, inténtelo de nuevo
                session.setAttribute("error", "Usuario o contraseña incorrectos, por favor, inténtelo de nuevo");
                response.sendRedirect("index.jsp");
            }

        %>
    </body>
</html>


