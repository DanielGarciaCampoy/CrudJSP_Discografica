
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista añadida correctamente</title>
        <!--bootstrap5 css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--codepen css-->
        <link rel="stylesheet" href="../css/loginStyle.css"/>
    </head>
     <body class="bg-dark">
        <!--conectarse a la bbdd-->
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/discografica","root", "");
            Statement s = conexion.createStatement();
                
            request.setCharacterEncoding("UTF-8");
            
            //comprobar si se repite codigo
            String consultaCodDiscog = "SELECT * FROM discografica WHERE CodDiscog="
                                + Integer.valueOf(request.getParameter("CodDiscog"));      
      
            ResultSet numDiscog = s.executeQuery (consultaCodDiscog);
            numDiscog.next();
            
            if (numDiscog.getRow() != 0) {
                %>
                    <div class="login-page">
                        <div class="form">
                            <h2>No se ha podido dar de alta, ya existe una discográfica con el código: <%out.println(request.getParameter("CodDiscog"));%></h2>
                <%
            } else {
                //Insertar datos introducidos
                String insercion = "INSERT INTO discografica VALUES ("
                                + Integer.valueOf(request.getParameter("CodDiscog"))
                                + ", '" + request.getParameter("NomDiscog") + "')";
                                
                                s.execute(insercion);
                %>
                <div class="login-page">
                    <div class="form">
                        <h2>Se ha añadido su discográfica correctamente:</h2>
                
        <%
            } //else
            conexion.close();
        %>
                        <button type="submit" value="Añadir" class="btn text-center"><a href="../listarDiscog.jsp">Volver a listaDiscog</a></button>
                    </div>           
                </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!--codepen js-->
        <script src="js/loginScript.js"></script>
    </body>
</html>
