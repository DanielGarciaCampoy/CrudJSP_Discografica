
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
        <!--bootstrap5 css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--codepen css y propio-->
        <link rel="stylesheet" href="css/loginStyle.css"/>
    </head>
    <body>
            <!--acceder a la bbdd-->
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/discografica","root", "");
                Statement s = conexion.createStatement();
                
                request.setCharacterEncoding("UTF-8");
            
                //En caso de error
                if (session.getAttribute("error") != null) { //comprueba error
                    if (session.getAttribute("error").equals("Usuario o contraseña incorrectos, por favor, inténtelo de nuevo")) { //comprueba el valor de error
                        session.setAttribute("error", "null"); //vuelve a darle error nulo a error
                        out.print("<script type=\"text/javascript\">alert(\"Usuario o contraseña incorrectos, por favor, inténtelo de nuevo\");</script>"); //ejecuta un alert con el mensaje de error
                    }
                }
            %>
            
            <!--login-->
            <div class="login-page" id="login">
                <div class="form">
                  <h2 class="mb-2">CRUD Discográfica</h2>
                  <h4>Inicio de sesión</h4>
                  <form class="login-form" method="get" action="login.jsp">
                    <input type="text" placeholder="usuario" name="usuario"  />
                    <input type="password" placeholder="contraseña" name="contrasenia"  />
                    <button type="submit">Iniciar Sesión</button>
                    <p class="message">¿No estás registrado? Consulta con el administrador</p>
                  </form>
                </div>
            </div>
            
        <!--bootstrap5 js-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!--codepen js-->
        <script src="js/loginScript.js"></script>
    </body>
</html>

