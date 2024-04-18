<%-- 
    Document   : registration
    Created on : Oct 1, 2023, 10:22:40 PM
    Author     : Mr Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
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
        <h1>Registration for host</h1>
        <form action="RegistrationServlet" method="POST">
            <label for="txtFullName">Full Name:</label>
            <input type="text" name="txtFullName" id="txtFullName" value="" />
            <label for="txtUsername">Username:</label>
            <input type="text" name="txtUsername" id="txtUsername" value="" />
            <label for="txtPassword1">Password:</label>
            <input type="password" name="txtPassword1" id="txtPassword1" value="" />
            <label for="txtPassword2">Confirm Password:</label>
            <input type="password" name="txtPassword2" id="txtPassword2" value="" />
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