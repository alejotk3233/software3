<%-- 
    Document   : Insertar_Pago
    Created on : 26/11/2016, 07:30:41 PM
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
            String NombreReserva=request.getParameter("NombreReserva");
            String Fecha=request.getParameter("Fecha");
            String Nombre=request.getParameter("NombrePasajero");
            String Monto=request.getParameter("monto");
            String TipoC=request.getParameter("TipoC");
            String NumC=request.getParameter("NumC");

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_Vuelos","root","123");
    Statement st=cn.createStatement();

//OJO: Todo en una Fila !!!
 String Consulta ="Insert Pago (IdReserva,Fecha,IdPasajero,Monto,Tipo_Comprobante,Num_Comprobante)" +  
         "Values ('" + NombreReserva+ "','" + Fecha + "','" + Nombre + "','" + Monto + "','" + TipoC + "'"
         + ",'" + NumC + "') ";

   
          int res = st.executeUpdate(Consulta);

              if (res == 1) {                 
              //out.println("<script>alert('El registro se modifico correctamente')</script>");
                    //out.println("<meta http-equiv='refresh' content='0;url=tabla.jsp'");
                    response.sendRedirect("Listado_Pago.jsp");
              } else {
                 out.println("error");
    }
 
   cn.close();

}catch(SQLException ex){
   response.sendRedirect("JspError.jsp");
   out.println("<h2>No se tuvo exito en la Grabación ! </h2>");
  
    while (ex!=null){
         out.println("Número de Error de SQL <h3>" + ex.getErrorCode() + "<p></h3>");
         out.println("Mensaje de Error de SQL <h3>" + ex.getMessage() + "</h3>");
         ex=ex.getNextException();
   }//fin de while
  
  
}catch(Exception e){
   out.println("<h2>Error, consulte con el Administrador del Sitio Web ! </h2>" + e.getMessage());
}
        %>
    </body>
</html>
