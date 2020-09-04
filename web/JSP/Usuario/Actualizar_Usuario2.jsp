<%-- 
    Document   : Actualizar_Usuario2
    Created on : 04/12/2016, 12:13:33 PM
    Author     : MIGUEL 19
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String Codigo=request.getParameter("Codigo");
            String Nombre=request.getParameter("Nombre");
            String Apellido=request.getParameter("Apellido");
            String Fecha=request.getParameter("Fecha");
            String Direccion=request.getParameter("Direccion");
            String Telefono=request.getParameter("Telefono");
            String Usuario=request.getParameter("Usuario");
            String Contraseña=request.getParameter("Password");
  

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_Vuelos","root","123");
    Statement st=cn.createStatement();

    String Consulta="UPDATE Usuario SET Nombres= '" + Nombre + "', Apellidos= '" + Apellido + "', Fecha_Nacimiento= '" + Fecha + "', Direccion= '" + Direccion + "',Telefono= '" + Telefono + "',User= '" + Usuario + "',Contraseña= '" + Contraseña + "' WHERE IdUsuario=" + Codigo;

              int res = st.executeUpdate(Consulta);

              if (res == 1) {
                  response.sendRedirect("Listado_Usuario.jsp");
              //out.println("<script>alert('El registro se modifico correctamente')</script>");
                    //out.println("<meta http-equiv='refresh' content='0;url=tabla.jsp'");
              } else {
                 out.println("error");
    }
    
  
    cn.close();
}
catch(SQLException ex){
   out.println("<h2> No se tuvo exito en la Actualización por: </h2>");

   while (ex!=null){

         out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "<p></h3>");
         ex=ex.getNextException();
   }//fin de while

} //fin catch

catch(Exception e){
     out.println("<h2>Error en la Actualización de Datos! </h2>" + e.getMessage());
}

%>
    </body>
</html>
