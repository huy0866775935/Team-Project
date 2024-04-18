<%-- 
    Document   : view_for_renter
    Created on : Oct 4, 2023, 5:25:40 PM
    Author     : Mr Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hoan.registration.RenterDTO"%>
<%@page import="hoan.registration.RegistrationDTO"%>
<%@page import="hoan.registration.RegistrationDAO"%>
<%@page import="hoan.registration.MessageDAO"%>
<%@page import="hoan.registration.SwitchDAO"%>
<%@page import="hoan.registration.SwitchDTO"%>
<%@page import="hoan.registration.RequestDTO"%>

<%@page import="java.util.ArrayList" %>


<%
        String username = (String) request.getSession().getAttribute("username");

     
        if(username == null){
            out.print("access deny");
        }else{
//        RenterDTO acc = (RenterDTO) request.getSession().getAttribute("account");

%>

<%
            if(request.getSession().getAttribute("account") == null){
                out.print("you are a host");
                 }else{
            RenterDTO acc = (RenterDTO) request.getSession().getAttribute("account");
                 
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS cho phần tử h1 */
            h1 {
                color: blue;
                font-size: 24px;
            }

            /* CSS cho phần tử table */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            /* CSS cho phần tử td */
            td {
                border: 1px solid black;
                padding: 8px;
            }

            /* CSS cho phần tử td đầu tiên trong mỗi hàng */
            td:first-child {
                font-weight: bold;
            }
            div {
                background-color: #f2f2f2;
                padding: 10px;
            }

            form {
                margin-top: 20px;
            }

            input[type="text"] {
                width: 300px;
                padding: 5px;
                border: 1px solid #ccc;
            }

            select {
                padding: 5px;
                border: 1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <h1>Welcome <%= acc.getFullName()%></h1>
        <table>
            <tr>
                <td>p.<%= acc.getRoom()%></td>
            </tr>

            <%
                RegistrationDAO dao = new RegistrationDAO();
                ArrayList<String> roomate_names = dao.get_roomate(acc.getHost(), acc.getRoom());
                for(String roomate : roomate_names){
            
            %>
            <tr>
                <td><%= roomate%></td>
            </tr>
            <%
                }
            %>
        </table>
        </br>
        </br>
        <div>
            host message: </br>
            <%
               MessageDAO d = new MessageDAO();
                ArrayList<String> ms = d.get_message_host(acc.getHost());
                for(String m : ms){
        
        
            %>
            <%= m%></br>
            <%
                }
    
            %>
        </div>
        </br>

        <div>
            send message to host:
            <form action="renter_message_servlet" method="post">
                <input type="text" name="message" value="">
                <input type="hidden" name="host" value="<%= acc.getHost()%>">
                <input type="hidden" name="room" value="<%= acc.getRoom()%>">
                <input type="submit" name="btAction" value="send">
            </form>
        </div>


        <%
            RegistrationDTO a = dao.getAccount_for_host(acc.getHost());
            int floors = a.getSo_tang();
            int rooms = a.getSo_phong();
         
        %>
        <div>
            Select the room you want to move to:
            <form action="Request_moveServlet" method="POST">
                <input type="hidden" name="room" value=<%=acc.getRoom() %>>
                <input type="hidden" name="renter" value=<%= acc.getUsername()%>><!-- comment -->
                <input type="hidden" name="host" value=<%=acc.getHost() %>>
                <select id="id" name="select">
                    <% for (int i = floors; i > 0; i--) {
                         int floor = 10 * i; 
                         for (int j = 1; j <= rooms; j++) { 
                             int room = j;
                             String index = Integer.toString(floor) + room;
                    %>
                    <option value=<%=index %>><%=index %></option>
                    <%
                        }
                    }
                    %>
                </select>
                <input type="submit" name="btAction">
            </form>
        </div>

        <div>
            Select person you want to switch room:
            <form action="SwitchServlet" method="POST">
                <input type="hidden" name="room" value=<%=acc.getRoom() %>>
                <input type="hidden" name="renter" value=<%= acc.getUsername()%>><!-- comment -->
                <input type="hidden" name="host" value=<%=acc.getHost() %>>

                <select name="select">
                    <%
                    SwitchDAO switchDAO = new SwitchDAO();    
                    ArrayList<SwitchDTO> people = switchDAO.get_people_in_bulding(acc.getRoom(), acc.getHost());
                    
                    for(SwitchDTO person : people){
                    %>
                    <option value=<%=person.getUsername() %>><%=person.getFullName() %>(P.<%=person.getRoom()%>)</option>
                    <%
                        }
                    %>
                    <input type="submit" name="bt" value="switch">
                </select>
            </form>
        </div>


        <div>
            <%
                SwitchDAO sDAO = new SwitchDAO();
                RegistrationDAO rDAO = new RegistrationDAO();
                ArrayList<RequestDTO> users = sDAO.get_request(acc.getHost());
                           
                for(RequestDTO user : users){
                    if(user.getUsername2().equals(acc.getUsername())){
                    RenterDTO u1 = rDAO.getAccount_for_renter(user.getUsername1());
                    RenterDTO u2 = rDAO.getAccount_for_renter(user.getUsername2());

            %>
            <form action="anwser_requestServlet" method="POST">
                <%=u1.getFullName()%> from p.<%=u1.getRoom()%> want to switch room with you
                <input type="hidden" name="username1" value=<%=u1.getUsername()%>>
                <input type="hidden" name="username2" value=<%=u2.getUsername()%>>
                <input type="hidden" name="room1" value=<%=u1.getRoom()%>>
                <input type="hidden" name="room2" value=<%=u2.getRoom()%>>

                <input type="hidden" name="host" value=<%=u1.getHost()%>>
          
                <input type="submit" name="bt" value="yes">
                <input type="submit" name="bt" value="no">

            </form>
            <%    
                }
}
            %>
        </div>

    </body>
</html>

<%
        }
    }
%>