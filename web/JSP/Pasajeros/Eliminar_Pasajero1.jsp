<%-- 
    Document   : Eliminar_Pasajero1
    Created on : 30/11/2016, 09:31:34 PM
    Author     : MIGUEL 19
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           
           String Codigo=request.getParameter("Codigo");
           
              ResultSet tabla=null;
  
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_Vuelos","root","123");
                 Statement st=cn.createStatement();

                 String ConsultaBorrar = "DELETE FROM Pasajero WHERE IdPasajero='" + Codigo + "'";
                 
                 int res = st.executeUpdate(ConsultaBorrar);

              if (res == 1) {
                  response.sendRedirect("Listado_Pasajero.jsp");
              //out.println("<script>alert('El registro se modifico correctamente')</script>");
                    //out.println("<meta http-equiv='refresh' content='0;url=tabla.jsp'");
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
                 }
   
            }catch(Exception e){
                 out.println("<h2>Error, consulte con el Administrador del Sitio Web ! </h2>" + e.getMessage());
            }
            %> 
    </body>
</html>
