<%-- 
    Document   : Actualizar_Avion2
    Created on : 01/12/2016, 09:38:19 PM
    Author     : MIGUEL 19
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
   String Codigo=request.getParameter("Codigo");
  String Aero=request.getParameter("Aerolinea");
  String Tipo=request.getParameter("Tipo");
   String Cap=request.getParameter("Capacidad");


try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_Vuelos","root","123");
    Statement st=cn.createStatement();

    String Consulta="UPDATE Avion SET Aerolinea= '" + Aero + "', Tipo= '" + Tipo + "', Capacidad= '" + Cap + "'"
            + " WHERE IdAvion=" + Codigo;

              int res = st.executeUpdate(Consulta);

              if (res == 1) {
                  response.sendRedirect("Listado_Avion.jsp");
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