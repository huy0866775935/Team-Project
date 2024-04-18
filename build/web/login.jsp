<%-- 
    Document   : login
    Created on : Oct 1, 2023, 10:15:26 PM
    Author     : Mr Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            input[type="text"], input[type="password"], select {
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
            }
        </style>
    </head>
    <body>
        <form action="DispatchController" method="POST">
            <label for="txtUsername">Username:</label>
            <input type="text" name="txtUsername" id="txtUsername" value="" />
            <label for="txtPassword">Password:</label>
            <input type="password" name="txtPassword" id="txtPassword" value="" />
            <label for="role">Login as:</label>
           
            <input type="submit" value="Login" name="btAction" />
            <input type="reset" value="Reset" />
            <h3>Sign up new account here:</h3>
            <input type="submit" value="Registration" name="btAction" />
        </form>
    </body>
</html>
