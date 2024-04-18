<%-- 
    Document   : message
    Created on : Oct 18, 2023, 4:35:09 PM
    Author     : Mr Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hoan.registration.MessageDAO"%>
<%@page import="java.util.ArrayList" %>
<%@page import="hoan.registration.RegistrationDTO"%>


<%
     RegistrationDTO acc = (RegistrationDTO) request.getSession().getAttribute("account");
     
     if(acc == null || acc.isRole() != true){
        out.print("access deny");
     }
     
     else{         
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           MessageDAO d = new MessageDAO();
           String room = (String) request.getParameter("room");
           String host = acc.getUsername();
            ArrayList<String> ms = d.get_message_renter(host, room);
            for(String m : ms){
        
        
        %>
        <%= m%></br>
        <%
            }
    
        %>
    </body>
</html>

<%
    }
%>
