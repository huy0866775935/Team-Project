<%-- 
    Document   : history
    Created on : Oct 13, 2023, 5:39:29 PM
    Author     : Mr Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hoan.registration.RegistrationDTO"%>
<%@page import="hoan.registration.RenterDTO"%>
<%@page import="java.util.ArrayList" %>

<% RegistrationDTO acc = (RegistrationDTO) request.getSession().getAttribute("account");
   ArrayList<RenterDTO> renters_infor = (ArrayList<RenterDTO>) request.getSession().getAttribute("renters_infor");
     
   if(acc == null || acc.isRole() != true){
      out.print("access deny");
   }
     
   else{    
    ArrayList<String> history = (ArrayList<String>) request.getAttribute("history");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            for(String h : history){
        %>
           <%= h%></br>
        <%
            }
        %>
    </body>
</html>
<%
    }
%>
