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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

<body>
    <section class="vh-150 bg-image" style="background-color: #3d0c86">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body p-5">
                                <h2 class="text-center h1 fw-bold mb-3">Sign in</h2>
                                <h5 class="text-center fw-bold mb-3 pb-3" style="letter-spacing: 1px">
                                    Create an account
                                </h5>

                                <form method="post" action="registerjsp.jsp">
                                    <div class="form-outline mb-4">
                                        <input name="u_fname" type="text" id="form3Example1cg" class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example1cg">Your Name</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input name="u_lname" type="text" id="form3Example1cg" class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example1cg">Your Lastname</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input name="u_phone" type="text" id="form3Example1cg" class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example1cg">Your Phonenumber</label>
                                    </div>
                                    <b>Choose your address:</b>
                                    <br />
                                    <p class="mb-3">Choose your province:</p>
                                        <%
                                        //แสดงค่า
                                        PreparedStatement p1 = conn.prepareStatement("SELECT * FROM city INNER JOIN province ON city.p_id = province.p_id;");
                                        ResultSet rsp1 = p1.executeQuery();
                                        %>
                                    <select id="province" class="form-control-lg mb-1" required>
                                        <option value="" class="text-center" selected>
                                            province
                                        </option>
                                            <%
                                                while (rsp1.next()) {
                                            %>
                                            <option class="text-center" value="<%= rsp1.getString("p_id") %>"><%= rsp1.getString("p_name") %></option>
                                            <%
                                                }
                                            %>
                                    </select>
                                    <p class="mb-3">Choose your district:</p>
                                    <%
                                        //แสดงค่า
                                        PreparedStatement p2 = conn.prepareStatement("SELECT * FROM city");
                                        ResultSet rsp2 = p2.executeQuery();
                                        %>
                                    <select name="city_id" id="district" class="form-control-lg mb-1" required>
                                        <option value="" class="text-center"selected>
                                            city
                                        </option>
                                            <%
                                                while (rsp2.next()) {
                                            %>
                                            <option class="text-center" value="<%= rsp2.getString("city_id") %>"><%= rsp2.getString("city_name") %></option>
                                            <%
                                                }
                                            %>
                                    </select>
                                    <div class="form-outline mb-4">
                                        <input name="u_house" type="text" id="form3Example3cg" class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example3cg">your village</label>
                                    </div>
                                    <br>
                                    <div class="form-outline mb-4">
                                        <input name="u_email" type="email" id="form3Example3cg" class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example3cg">Your Email</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input name="u_pass" type="password" id="form3Example4cg"
                                            class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example4cg">Password</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input name="conf_pass" type="password" id="form3Example4cdg"
                                            class="form-control form-control-lg" required/>
                                        <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                    </div>

                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <input class="form-check-input me-2" type="checkbox" value=""
                                            id="form2Example3cg" />
                                        <label class="form-check-label" for="form2Example3g">
                                            I agree all statements in
                                            <a href="#!" class="text-body"><u>Terms of service</u></a>
                                        </label>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-dark btn-lg btn-block">
                                            Register
                                        </button>
                                    </div>

                                    <p class="text-center text-muted mt-5 mb-0">
                                        Have already an account?
                                        <a href="login.html" class="fw-bold text-body"><u>Login here</u></a>
                                    </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>