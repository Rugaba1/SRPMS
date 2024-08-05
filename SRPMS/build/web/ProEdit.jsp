<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome To SRPMS</title>
    <link rel="icon" href="icon/icon.jpeg" type="image/x-icon">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        header {
            background-color: #30336b;
            color: #ffffff;
            text-align: center;
            padding: 20px;
            font-size: 24px;
        }
        footer {
            background-color: #30336b;
            color: #ffffff;
            text-align: center;
            padding: 20px;
            font-size: 12px;
        }

        nav {
            background-color: #f9ca24;
            text-align: center;
            padding: 10px;
            color: #2c3e50;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }
        nav:hover {
            color: #e74c3c;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: 30%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            text-align: center;
        }
        input[type="submit"]{
            width: 140px;
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover{
            background-color: #00cc00;
        }
        input[type="reset"]{
            width: 140px;
            background-color: #f9ca24;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="reset"]:hover{
            background-color: #ff6666;
        }
        a {
            color: #30336b;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s;
        }
        a:hover {
            color: #e74c3c;
        }
        footer a{
            color: wheat;
        }
    </style>
</head>
<body>
    <header>Welcome To Student Request Portal Management System</header>
    <nav>
    <nav>
        <a href="AdminHome.jsp">Home</a>
        <a href="AdminQuestion.jsp">Request-List</a>
        <a href="DisplayUser.jsp">Students</a>
        <a href="DisplayPro.jsp">Staff</a>
        <a href="Logout">Logout</a>
    </nav>
    </nav>
<center><br>
    <main>
        <%
         String id = request.getParameter("id");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
        String sql = "SELECT * FROM professionor WHERE pid='"+id+"'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
        
        %>
        <form action="ProEdit.jsp" method="POST">
            <label>Identification :</label>
            <input type="text" name="id" value="<%= id%>" required/>
            <label>Firstname :</label>
            <input type="text" name="fname" value="<%=rs.getString(2)%>" required/>
            <label>Lastname :</label>
            <input type="text" name="lname" value="<%=rs.getString(3)%>" required/>
            <label>Username :</label>
            <input type="text" name="uname" value="<%=rs.getString(4)%>" required/>
            <label>Password :</label>
            <input type="password" name="pass" value="<%=rs.getString(5)%>" required/><br>
            <input type="submit" value="Edit">
            <input type="reset" value="Cancel">
        </form>
    </main
       <%
        }
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String uname=request.getParameter("uname");
        String pass=request.getParameter("pass");
        String upd="UPDATE professionor SET pid = ?,Firstname = ?,Lastname = ?,Username = ?,Password = ? WHERE pid ='"+id+"'";
        PreparedStatement ps = con.prepareStatement(upd);
        ps.setString(1, id);
        ps.setString(2, fname);
        ps.setString(3, lname);
        ps.setString(4, uname);
        ps.setString(5, pass);
        
        ps.executeUpdate();
        out.print("Done!");
        response.sendRedirect("DisplayPro.jsp");
}
catch(Exception ex){
  ex.printStackTrace();
}
        %>
    <br>
    </center><br>
<footer>
    This Is Student Request Portal Management System!!!<br>
    You Can Contact As on : <br>
    Email: <a href="https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=new">studentaffairs@gmail.com</a><br>
    Call: +250790673235<br>
    Website: <a href="https://www.rp.ac.rw/">RP-Website</a><br>
    &copy;Balinda 2024!
</footer>
</body>
</html>

