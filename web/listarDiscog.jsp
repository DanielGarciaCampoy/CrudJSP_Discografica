
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD Discografica - Listar Discográficas</title>
        <!--bootstrap5 css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- css propio -->
        <link rel="stylesheet" href="css/styleListar.css"/>
    </head>
    <body class="bg-black bg-gradient">
        <div class="container text-light">
            <!--conectarse a la bbdd-->
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/discografica","root", "");
                Statement s = conexion.createStatement();
                
                ResultSet listado = s.executeQuery ("SELECT * FROM discografica");
            %>
            <!--inicio navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-success sticky-top">
                <div class="container-fluid">
                  <a class="navbar-brand" href="index.jsp"><img src="img/person.png" width="40"/>Cerrar sesión</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                      <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="listarAlbum.jsp">Lista de Álbumes</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Lista de Discográficas</a>
                      </li>
                    </ul>
                  </div>
                </div>
            </nav>
            <!--fin navbar-->
            
            <h1 class="text-center"><br><b>Discográficas</b></h1>
            
            <!--tabla, listar albumes-->
            <table class="table table-stripped mt-3 text-light bg-secondary bg-opacity-25">
                <tr class="bg-success"><th>Código</th><th>Nombre</th><th>Modificaciones</th></tr>
                <!--grabar filas-->
                <form method="get" action="Discog/grabarDiscog.jsp">
                    <tr>
                        <td><input type="text" name="CodDiscog" class="form-control"></td>
                        <td><input type="text" name="NomDiscog" class="form-control"></td>
                        <td><button type="submit" value="Añadir" class="btn btn-success">+Añadir</button></td><td></td>
                    </tr>           
                </form>
                <!--listado-->
                <%
                    while (listado.next()) {
                        out.println("<tr><td>");
                        out.println(listado.getString("CodDiscog") + "</td>");
                        out.println("<td>" + listado.getString("NomDiscog") + "</td>");
                %>
                
                <td>
                    <div class="row">
                        <div class="col">
                            <!--boton borrado-->
                            <form method="get" action="Discog/borraDiscog.jsp">
                                <input type="hidden" name="codigo" value="<%=listado.getString("CodDiscog") %>"/>
                                <input type="submit" value="✘Borrar" class="bg-danger text-light">
                            </form>
                        </div>
                        <div class="col">
                            <!--boton modificar-->
                            <form method="get" action="Discog/modificaDiscog.jsp">
                                <input type="hidden" name="CodDiscog" value="<%=listado.getString("CodDiscog") %>">
                                <input type="hidden" name="NomDiscog" value="<%=listado.getString("NomDiscog") %>">
                                <input type="submit" value="✎Modificar" class="bg-success">
                            </form>
                        </div>
                    </div>
                </td></tr>
                
            <%
                    out.println("</td><tr>");
                } //cierre while
                conexion.close();
            %>
            </table>
        </div>
        <!--bootstrap5 js-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
