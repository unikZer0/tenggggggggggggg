<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Connection conn = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
}catch(Exception e){
     out.println(e);   
} 
%>
<%
//แสดงค่า
PreparedStatement pstmt1 = conn.prepareStatement("SELECT user.*,city.city_name,province.p_name  " +
    "FROM user " +
    "INNER JOIN city ON user.city_id = city.city_id " +
    "INNER JOIN province ON city.p_id = province.p_id;");
ResultSet rs = pstmt1.executeQuery();
%>
<table style="border:1">
            <tr>
                <th>ID</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Password</th>
                <th>House</th>
                <th>City</th>
                <th>province</th>

            </tr>
            <%
               while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("u_id") %></td>
                <td><%= rs.getString("u_fname") %></td>
                <td><%= rs.getString("u_lname") %></td>
                <td><%= rs.getString("u_phonenumber") %></td>
                <td><%= rs.getString("u_email") %></td>
                <td><%= rs.getString("u_password") %></td>
                 <td><%= rs.getString("u_house") %></td>
                 <td><%= rs.getString("city_name") %></td>
                 <td><%= rs.getString("p_name") %></td>
                <td>
            <!-- Delete button -->
            <form action="" method="post">
                <input type="hidden" name="delete_id" value="<%= rs.getString("u_id") %>">
                <input type="submit" value="Delete" name="delete">
            </form>
        </td>
            </tr>
            <%
               }
            %>
        </table>
 <%
String deleteID = request.getParameter("delete_id");
String deleteSubmit = request.getParameter("delete");
if (deleteID != null && deleteSubmit != null) {
    PreparedStatement delete = conn.prepareStatement("DELETE FROM book_author WHERE a_id = ?");
    delete.setString(1, deleteID);
    delete.executeUpdate();
    delete.close();
}
%>
</body>
</html>