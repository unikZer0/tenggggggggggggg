<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String u_fname=request.getParameter("u_fname");
String u_lname=request.getParameter("u_lname");
String u_phone=request.getParameter("u_phone"); 
String city_id=request.getParameter("city_id");
String u_house=request.getParameter("u_house"); 
String u_email=request.getParameter("u_email");
String u_pass=request.getParameter("u_pass");
String conf_pass=request.getParameter("conf_pass");


try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
    PreparedStatement pstmt1 = conn.prepareStatement("SELECT * FROM user WHERE u_phonenumber = ? OR u_email = ?");
    pstmt1.setString(1, u_phone);
    pstmt1.setString(2, u_email);
    ResultSet rs = pstmt1.executeQuery();
     if (rs.next()) {
        out.println("<script> alert('PhoneNumber or Email Has Already Taken'); </script>");
        out.println("<script> location.href='register.jsp'; </script>");
    }
    else {
        if (u_pass.equals(conf_pass)) {
            // เพิ่มข้อมูลผู้ใช้ลงในฐานข้อมูล
            PreparedStatement pstmt2 = conn.prepareStatement("insert into user (u_fname,u_lname,u_phonenumber,u_email,u_password,u_house,city_id) values(?,?,?,?,?,?,?)");
            pstmt2.setString(1, u_fname);
            pstmt2.setString(2, u_lname);
            pstmt2.setString(3, u_phone);
            pstmt2.setString(4, u_email);
            pstmt2.setString(5, u_pass);
            pstmt2.setString(6, u_house);
            pstmt2.setString(7, city_id);

            pstmt2.executeUpdate();
            pstmt2.close();

            out.println("<script> alert('Registration Successful'); </script>");
            out.println("<script> location.href='login.html'; </script>");
        } else {
            out.println("<script> alert('Passwords do not match'); </script>");
            out.println("<script> location.href='register.jsp'; </script>");
        }
    }
    rs.close();
    pstmt1.close();

    conn.close();
     
}catch(Exception e){
    out.println(e);   
} 
%>

