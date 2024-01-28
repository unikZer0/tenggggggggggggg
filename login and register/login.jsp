<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String username = request.getParameter("user");
String password = request.getParameter("pass");


try {
    // ตรวจสอบว่า username หรือ email มีในฐานข้อมูลหรือไม่
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM user WHERE u_email = ?");
    pstmt.setString(1, username);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        // พบผู้ใช้, ตรวจสอบรหัสผ่าน
        if (password.equals(rs.getString("u_password"))) {
            // รหัสผ่านถูกต้อง, ตั้งค่าตัวแปร session และ redirect ไปที่ index.jsp
            boolean r=true;
            session.setAttribute("login", r);
            response.sendRedirect("../index.jsp");
        } else {
            out.println("<script> alert('ລະຫັດບໍ່ຖືກ'); </script>");
            out.println("<script> window.location.href='login.html'; </script>");
        }
    } else {
        // ไม่พบผู้ใช้ที่ลงทะเบียน
        out.println("<script> alert('ບໍ່ພົບເບີ ຫຼື ອີເມວ ຂອງຜູ້ໃຊ້'); </script>");
        out.println("<script> window.location.href='login.html'; </script>");
    }
} catch (Exception e) {
    out.println(e); 
}
%>
