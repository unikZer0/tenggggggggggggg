
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
try{
     Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
    String m_image = request.getParameter("m_image");
    String m_title = request.getParameter("m_title");
    String m_synopsis = request.getParameter("m_synopsis");
    String m_price = request.getParameter("m_price");
    String m_file = request.getParameter("m_file");
    String mt_id = request.getParameter("mt_id");
    PreparedStatement insert2 = conn.prepareStatement("INSERT INTO manga (m_image, m_title, m_synopsis, m_price, m_file, mt_id) VALUES (?, ?, ?, ?, ?, ?)");
    insert2.setString(1, m_image);
    insert2.setString(2, m_title);
    insert2.setString(3, m_synopsis);
    insert2.setString(4, m_price);
    insert2.setString(5, m_file);
    insert2.setString(6, mt_id);
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
    m_image <input type="text" name="m_image">
    m_title <input type="text" name="m_title">
    m_synopsis <input type="text" name="m_synopsis">
    m_price <input type="text" name="m_price">
    m_file <input type="text" name="m_file">

    <%
    //แสดงค่า
    PreparedStatement p1 = conn.prepareStatement("SELECT * FROM mangatype");
    ResultSet rsp1 = p1.executeQuery();
    %>
    <select name="mt_id">
        <option value="do not have" selected>do not have</option>
         <%
               while (rsp1.next()) {
        %>
         <option value="<%= rsp1.getString("mt_id") %>"><%= rsp1.getString("mt_name") %></option>
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
		"SELECT manga.*, mangatype.mt_name FROM manga INNER JOIN mangatype ON manga.mt_id = mangatype.mt_id; ");
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
                <th>mangatype</th>
            </tr>
            <%
               while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("m_id") %></td>
                <td><%= rs.getString("m_image") %></td>
                <td><%= rs.getString("m_title") %></td>
                <td><%= rs.getString("m_synopsis") %></td>
                <td><%= rs.getString("m_price") %></td>
                <td><%= rs.getString("m_file") %></td>
                <td><%= rs.getString("mt_name") %></td>
                <td>
            <!-- Delete button -->
            <form action="" method="post">
                <input type="hidden" name="delete_id" value="<%= rs.getString("m_id") %>">
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
    PreparedStatement delete = conn.prepareStatement("DELETE FROM manga WHERE m_id = ?");
    delete.setString(1, deleteID);
    delete.executeUpdate();
    delete.close();
}
%>
       
</div> 
</body>
</html>