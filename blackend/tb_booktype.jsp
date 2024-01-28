
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div class="align-centers">
<form action=""method="post">
bt_name
<input type="text" name="bt_name">
<input type="submit" value="submit" name="s">
</form>
<%
String submit=request.getParameter("s");
if (submit != null){
    out.println("<script> window.location.href='homeblack.html'; </script>");
}

Connection conn = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
    // เอาค่าเข้า
    String bt_name=request.getParameter("bt_name");
PreparedStatement insert2 = conn.prepareStatement("insert into booktype (bt_name) values (?)");
insert2.setString(1, bt_name);
insert2.executeUpdate();
insert2.close();
}catch(Exception e){
    // out.println(e);   
} 
%>
<%
//แสดงค่า
PreparedStatement pstmt1 = conn.prepareStatement("SELECT * FROM booktype");
ResultSet rs = pstmt1.executeQuery();
%>
<table style="border:1">
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
            <%
               while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("bt_id") %></td>
                <td><%= rs.getString("bt_name") %></td>
                <td>
            <!-- Delete button -->
            <form action="" method="post">
                <input type="hidden" name="delete_id" value="<%= rs.getString("bt_id") %>">
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
    PreparedStatement delete = conn.prepareStatement("DELETE FROM booktype WHERE bt_id = ?");
    delete.setString(1, deleteID);
    delete.executeUpdate();
    delete.close();
}
%>
       
</div> 
</body>
</html>