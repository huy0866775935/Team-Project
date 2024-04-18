<%-- 
    Document   : view_for_host
    Created on : Oct 4, 2023, 5:26:01 PM
    Author     : Mr Viet
--%>
<%@page import="hoan.registration.RegistrationDTO"%>
<%@page import="hoan.registration.RenterDTO"%>
<%@page import="hoan.registration.change_roomDAO"%>
<%@page import="hoan.registration.change_roomDTO"%>

<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     RegistrationDTO acc = (RegistrationDTO) request.getSession().getAttribute("account");
     ArrayList<RenterDTO> renters_infor = (ArrayList<RenterDTO>) request.getSession().getAttribute("renters_infor");
     
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

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            h1 {
                text-align: center;
                color: #333;
                margin-top: 50px;
            }
            h2 {
                text-align: center;
                color: #333;
                margin-top: 50px;
            }
            form {
                text-align: center;
                margin-top: 50px;
            }
            input[type="text"] {
                padding: 10px;
                border-radius: 5px;
                border: none;
                margin: 10px;
                font-size: 16px;
                width: 200px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                border: none;
                color: #fff;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
            }
            input[type="submit"]:hover {
                background-color: #3e8e41;
            }
            table {
                margin: 50px auto;
                border-collapse: collapse;
                width: 80%;
                max-width: 800px;
            }
            td {
                padding: 10px;
                text-align: center;
                vertical-align: middle;
                font-size: 16px;
                color: #333;
                background-color: #fff;
                border: 1px solid #ddd;
                width: 100px;
                height: 100px;
            }
            td table {
                margin: 0 auto;
                width: 80%;
                max-width: 200px;
            }
            td table tr:first-child {
                background-color: #333;
                color: #fff;
            }
            td table tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            td table tr:last-child {
                background-color: #ddd;
            }
            form {
                width: 50%; /* Đặt chiều rộng của form là 50% */
            }
        </style>

    </head>
    <body>
        <%
            if(acc.getSo_tang() == 0 || acc.getSo_phong() == 0 || acc.getMax() == 0){
        %>    
        <h2>Please enter the floor number and number of rooms on each floor in your building:</h2></br>
        <form action="HostServlet" method="POST">
            number of floors:<input type="text" name="number_floors" value=""></br>
            number of rooms:<input type="text" name="number_rooms" value=""></br>
            number of people in a room:<input type="text" name="max" value=""></br>
            <input type="submit" value="Enter" name="btAction" />
            <input type="reset" value="Reset" />
        </form>

        <%
            }else{
           
            int floors = acc.getSo_tang();
            int rooms = acc.getSo_phong();
            
            int n = floors * rooms;
            int[] counts = new int[n];
            int c = 0;
        %>

        <h1>welcome <%= acc.getFullName()%></h1>



        <table border="1">
            <% for (int i = floors; i > 0; i--) {
                int floor = 10 * i;
            %>
            <tr>
                <% for (int j = 1; j <= rooms; j++) { 
                    int room = j;
                    String index = Integer.toString(floor) + room;
                %>
                <td>
                    <table border="1">
                        <tr>
                            <td>P.<%= index %></td>
                            <td>
                                <form action="DispatchController" method="POST">
                                    <input type="hidden" name="room" value="<%= index%>"/>
                                    <input type="hidden" name="host" value="<%= acc.getUsername()%>"/>
                                    <input type="submit" value="history" name="btAction">
                                    <input type="submit" value="message" name="btAction">
                                </form>

                        </tr>
                        <%
                            for(RenterDTO renter : renters_infor){
                                if(index.equals(renter.getRoom())){
                                counts[c]++;
                        %>
                        <tr>
                            <td><%= renter.getFullName()%></td>
                            <td>
                                <form action="DispatchController" method="POST">
                                    <input type="hidden" name="username_renter" value="<%= renter.getUsername()%>"/>
                                    <input type="submit" value="-" name="btAction"/>
                                </form>
                            </td>
                        </tr><%


                                                        }

                            }int d = c; c++;
                        %>
                        <tr>
                            <td>
                                <form action="DispatchController" method="POST">
                                    <input type="hidden" name="room" value="<%= index%>" />
                                    <input type="hidden" name="host" value="<%= acc.getUsername()%>" />
                                    <input type="hidden" name="count" value=<%= counts[d]%>>
                                    <input type="submit" value="add" name="btAction"/>
                                </form>
                            </td>
                        </tr>
                    </table>
                </td>
                <% }
                    %>
            </tr>
            <% } %>
        </table>

        </br>
        <form action="host_message_servlet" method="post">
            send message:
            <input type="text" name="message" value="">
            <input type="hidden" name="host" value="<%= acc.getUsername()%>" />
            <input type="submit" name="btAction" value="send">
        </form><br>

        <div>
            <%
                change_roomDAO change = new change_roomDAO();
                ArrayList<change_roomDTO> requests = change.get_all_request(acc.getUsername());
                for(change_roomDTO request1 : requests){
                if(request1.getHost_response() != false){
                    continue;
                }else{
            %>

            <form action="Response_hostServlet" method="POST">
                <%=request1.getRenter() %> want to move from <%=request1.getRoom1() %> to <%=request1.getRoom2() %>
                <input type="hidden" name="renter" value=<%=request1.getRenter() %>>
                <input type="hidden" name="change_room" value=<%=request1.getRoom2() %>>
                <input type="submit" value="yes" name="bt">
                <input type="submit" value="no" name="bt">
            </form>

            <%
                }
}
            %>
        </div>


        <%
            }
        %>
    </body>
</html>

<%
    }
%>
