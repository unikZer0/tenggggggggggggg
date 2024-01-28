
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_project_jsp","root","");
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
<style>
    .typenav ul li .humor {
    text-decoration: none;
    border: 2px solid #000;
    border-top:none ;
    border-left: none;
    border-right: none;
    /* border: 1px solid #000; */
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="../assets/style.css">
<body>
    <div class="container">
        <div class="between">
            <div class="logo">
                <a href="../index.jsp" class="home-logo"><h1 class="logo"><img src="../assets/pictures/thirdeyes.jpeg" alt=""></h1></a>
            </div>
            <div class="register">
                <a href="../login and register/register.jsp" >ສ້າງບັນຊີ</a>
                <a href="../login and register/login.html" >ເຂົ້າສູ່ລະບົບ</a>
            </div>
        </div>
        <div class="below-navbar">
            <ul>
                <li><a href="../book.jsp" class="book hover">ປຶ້ມ</a></li>
                <li><a href="../manga.jsp" class="manga hover">ປຶ້ມກາຕູນ</a></li>
                <li> <div class="dropdown">
                    <div class="selector">
                        <div class="hover">ຫມວດຫມູ່</div><i class="bi bi-chevron-down icon"></i>
                    </div>
                    <div class="lists">
                        <div class="list"><a href="../bundlebook.jsp" target="_blank" class="hover">bundlebook</a></div>
                        <div class="list"><a href="../bundlemanga.jsp" target="_blank" class="hover">bundlemanga</a></div>
                    </div>
                </div></li>
                <li><a href="#" class="about hover">ກ່ຽວກັບເຮົາ</a></li>
            </ul>
            <div class="con-search">
                <div class="search">
                    <input type="search" placeholder="Search" >
                    <div class="con-icon"><div class="active"><i class="bi bi-search"></i></div></div>
                </div>
            </div>
        </div>
        <div class="con-typenav">
            <div class="typenav">
                <ul>
                    <li><a href="../bundlebook.jsp" class="Adventure">Adventure stories</a></li>
                    <li><a href="./crime.jsp" class="crime">crime</a></li>
                    <li><a href="./fantasy.jsp" class="fantasy">fantasy</a></li>
                    <li><a href="./horror.jsp" class="horror">horror</a></li>
                    <li><a href="./humor.jsp" class="humor">humor</a></li>
                    <li><a href="./romance.jsp" class="romance">romance</a></li>
                    <li><a href="./war.jsp" class="war">war</a></li>
                    <li><a href="./thrillers.jsp" class="thrillers">thrillers</a></li>
                </ul>
            </div>
        </div>
        <br>
        <p class="margin">humor</p>
        <br>
        <div class="con-cont">
            <div class="main-cont">
               <%
            //แสดงค่า
            PreparedStatement pb = conn.prepareStatement("SELECT * FROM book where bt_id=6");
            ResultSet rsb = pb.executeQuery();
            %>
                 <%
                    while (rsb.next()) {
                 %>
                <div class="mybook"><a href="../page of book/book1"><img src="../assets/pictures/pic_book/adventure/<%= rsb.getString("b_image") %>" alt=""></a></div>
                <%
                }
                %>
            </div>
        </div>
        <hr>
        <div class="footer">
            <div class="logo-footer">
                <h1>Logo</h1>
                <p>create/develop by :  </p>
                <h4>2CW3</h4>
                <p>follow for more new and content :</p><br>
            </div>
            <div class="about-footer">
                <h1>About us</h1>
                <p>about our group</p>
                <p>work@CW3group</p>
                <a href="#">contact us</a>
                <p>we are students at NUOL</p>
            </div>
        </div>
    </div>
    <script src="../dropdown.js">
    </script>
</body>
</html>