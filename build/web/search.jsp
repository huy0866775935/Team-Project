<%-- 
    Document   : search
    Created on : Dec 22, 2022, 7:03:20 PM
    Author     : Teacher
--%>

<%@page import="hoan.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     if(request.getSession().getAttribute("USERNAME") == null){
        out.print("deny");
    }
    else{
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <div>Search</div>
        <form action="DispatchController">
            Search Value: <input type="text" name="txtSearchValue" value="<%= request.getParameter("txtSearchValue")%>" /></br>
            <input type="submit" value="Search" name="btAction" />
        </form>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result 
                        = (List<RegistrationDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
                    %>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Full name</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            int count = 0;
                            for (RegistrationDTO dto: result){
                                %>
                                <tr>
                                    <td>
                                        <%= ++count %>
                                    </td>
                                    <td>
                                        <%= dto.getUsername() %>
                                    </td>
                                    <td>
                                        <%= dto.getPassword() %>
                                    </td>
                                    <td>
                                        <%= dto.getFullName() %>
                                    </td>
                                    <td>
                                        <%= dto.isRole() %>
                                    </td>
                                </tr>
                                <%
                            } //end for traversing dto   
                            %>
                        </tbody>
                    </table>

                    <%
                } 
                else {
                    %>
                    <h2>
                        No record is matched!!
                    </h2>
                    <%
                }
            } //check first time for search value
       } %>

    </body>
</html>
