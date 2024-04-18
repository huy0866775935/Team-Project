<%-- 
    Document   : registration_for_renter
    Created on : Oct 5, 2023, 10:13:52 PM
    Author     : Mr Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hoan.registration.RegistrationDTO"%>


<%
     RegistrationDTO acc = (RegistrationDTO) request.getSession().getAttribute("account");
     
     if(acc == null || acc.isRole() != true){
        out.print("access deny");
     }
    else if (Integer.parseInt(request.getParameter("count")) == acc.getMax()) {
        out.print("this room is max size");
    }
     
     else{         
        String room = request.getParameter("room");
        String host = request.getParameter("host");

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration_for_renter</title>
         <style>
            body {
                background-color: #f2f2f2;
            }
            form {
                margin: 50px auto;
                width: 300px;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: none;
                border-radius: 5px;
                box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            }
            input[type="submit"], input[type="reset"] {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                border: none;
                border-radius: 5px;
                background-color: #4CAF50;
                color: #fff;
                cursor: pointer;
            }
            input[type="submit"]:hover, input[type="reset"]:hover {
                background-color: #3e8e41;
            }
            h3 {
                margin-bottom: 0;
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Registration for renter</h1>
        <form action="RegistrationServlet_for_renter" method="POST">
            <label for="txtFullName">Full Name:</label>
            <input type="text" name="txtFullName" id="txtFullName" value="" />
            <label for="txtUsername">Username:</label>
            <input type="text" name="txtUsername" id="txtUsername" value="" />
            <label for="txtPassword1">Password:</label>
            <input type="password" name="txtPassword1" id="txtPassword1" value="" />
            <label for="txtPassword2">Confirm Password:</label>
            <input type="password" name="txtPassword2" id="txtPassword2" value="" />
            
            <input type="hidden" name ="room" value="<%= room%>">
            <input type="hidden" name ="host" value="<%= host%>">
            
            <input type="submit" value="Registration" name="btAction" />
            <input type="reset" value="Reset" />
            <% 
            if(request.getAttribute("ms") != null){ 
            %>
                <h3><%= request.getAttribute("ms") %></h3>
            <%
                } 
            %>
        </form>
    </body>
</html>
<%
    }
%>
