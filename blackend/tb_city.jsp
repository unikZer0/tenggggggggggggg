
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
    // เอาค่าเข้า
    String city_name=request.getParameter("city_name");
    String p_id=request.getParameter("p_id");
PreparedStatement insert2 = conn.prepareStatement("insert into city (city_name,p_id) values (?,?)");
insert2.setString(1,city_name);
insert2.setString(2,p_id);
insert2.executeUpdate();
insert2.close();
}catch(Exception e){
    // out.println(e);   
} 
%>
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
city_name	
<input type="text" name="city_name">
<%    //แสดงค่า
    PreparedStatement p2 = conn.prepareStatement("SELECT * FROM province");
    ResultSet rsp2 = p2.executeQuery();
    %>
        <select name="p_id">
        <option value="do not have" selected>do not have</option>
         <%
               while (rsp2.next()) {
        %>
         <option value="<%= rsp2.getString("p_id") %>"><%= rsp2.getString("p_name") %></option>
        <%
               }
        %>
    </select>
<input type="submit" value="submit" name="s">
</form>
<%
String submit=request.getParameter("s");
if (submit != null){
    out.println("<script> window.location.href='homeblack.html'; </script>");
}
%>
<%
//แสดงค่า
PreparedStatement pstmt1 = conn.prepareStatement("SELECT city.*,province.p_name FROM city INNER JOIN province ON city.p_id = province.p_id;");
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
                <td><%= rs.getString("city_id") %></td>
                <td><%= rs.getString("city_name") %></td>
                <td><%= rs.getString("p_name") %></td>
                <td>
            <!-- Delete button -->
            <form action="" method="post">
                <input type="hidden" name="delete_id" value="<%= rs.getString("city_id") %>">
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
    PreparedStatement delete = conn.prepareStatement("DELETE FROM city WHERE city_id = ?");
    delete.setString(1, deleteID);
    delete.executeUpdate();
    delete.close();
}
%>
       
</div> 
</body>
</html>