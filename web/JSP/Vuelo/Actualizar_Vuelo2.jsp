<%-- 
    Document   : Actualizar_Vuelo2
    Created on : 02/12/2016, 10:31:01 AM
    Author     : uno
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
  String Reserva=request.getParameter("Reserva");
  String Nombre=request.getParameter("Nombre");
   String Pais=request.getParameter("Pais");
  String Tarifa=request.getParameter("Tarifa");
  String Asiento=request.getParameter("Asiento");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_Vuelos","root","123");
    Statement st=cn.createStatement();

    String Consulta="UPDATE Vuelo SET IdReserva= '" + Reserva + "', Nombre_Aeropuerto= '" + Nombre + "',"
            + "Pais_Aeropuerto= '" + Pais + "', Tarifa= '" + Tarifa + "', Asiento= '" + Asiento + "'"
            + " WHERE IdAvion=" + Codigo;

              int res = st.executeUpdate(Consulta);

              if (res == 1) {
                  response.sendRedirect("Listado_Vuelo.jsp");
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
