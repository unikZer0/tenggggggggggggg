
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
try{
     Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
        String b_image = request.getParameter("b_image");
    String b_title = request.getParameter("b_title");
    String b_synopsis = request.getParameter("b_synopsis");
    String b_price = request.getParameter("b_price");
    String a_id = request.getParameter("a_id");
    String bt_id = request.getParameter("bt_id");
    PreparedStatement insert2 = conn.prepareStatement("insert into book (b_image, b_title, b_synopsis,b_price, a_id, bt_id) values (?, ?, ?, ?, ?, ?)");
    insert2.setString(1, b_image);
    insert2.setString(2, b_title);
    insert2.setString(3, b_synopsis);
    insert2.setString(4, b_price);
    insert2.setString(5, a_id);
    insert2.setString(6, bt_id);
    insert2.executeUpdate();
    insert2.close();
} catch(Exception e){
    //out.println(e);   
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
<form action="" method="post">
    b_image <input type="text" name="b_image">
    b_title <input type="text" name="b_title">
    b_synopsis <input type="text" name="b_synopsis">
    b_price <input type="text" name="b_price">
    <%
    //แสดงค่า author
    PreparedStatement p1 = conn.prepareStatement("SELECT * FROM book_author");
    ResultSet rsp1 = p1.executeQuery();
    %>
    <select name="a_id">
        <option value="do not have" selected>do not have</option>
         <%
               while (rsp1.next()) {
        %>
         <option value="<%= rsp1.getString("a_id") %>"><%= rsp1.getString("a_name") %></option>
        <%
               }
        %>
    </select>
        <%
    //แสดงค่า booktype
    PreparedStatement p2 = conn.prepareStatement("SELECT * FROM booktype");
    ResultSet rsp2 = p2.executeQuery();
    %>
        <select name="bt_id">
        <option value="do not have" selected>do not have</option>
         <%
               while (rsp2.next()) {
        %>
         <option value="<%= rsp2.getString("bt_id") %>"><%= rsp2.getString("bt_name") %></option>
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
PreparedStatement pstmt1 = conn.prepareStatement(
		"SELECT book.*, booktype.bt_name, book_author.a_name " +
			    "FROM book " +
			    "INNER JOIN booktype ON book.bt_id = booktype.bt_id " +
			    "INNER JOIN book_author ON book.a_id = book_author.a_id;");
ResultSet rs = pstmt1.executeQuery();
%>
<table style="border:1">
            <tr>
                <th>ID</th>
                <th>ImageName</th>
                <th>title</th>
                <th>synopsis</th>
                <th>price</th>
                <th>author</th>
                <th>booktype</th>
            </tr>
            <%
               while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("b_id") %></td>
                <td><%= rs.getString("b_image") %></td>
                <td><%= rs.getString("b_title") %></td>
                <td><%= rs.getString("b_synopsis") %></td>
                <td><%= rs.getString("b_price") %></td>
                <td><%= rs.getString("a_name") %></td>
                <td><%= rs.getString("bt_name") %></td>
                <td>
            <!-- Delete button -->
            <form action="" method="post">
                <input type="hidden" name="delete_id" value="<%= rs.getString("b_id") %>">
                <input type="submit" value="Delete" name="delete">
            </form>
        </td>
            </tr>
            <%
               }
            %>
        </table>
 <%
 //เอาค่าออก
String deleteID = request.getParameter("delete_id");
String deleteSubmit = request.getParameter("delete");
if (deleteID != null && deleteSubmit != null) {
    PreparedStatement delete = conn.prepareStatement("DELETE FROM book WHERE b_id = ?");
    delete.setString(1, deleteID);
    delete.executeUpdate();
    delete.close();
}
%>
       
</div> 
</body>
</html>