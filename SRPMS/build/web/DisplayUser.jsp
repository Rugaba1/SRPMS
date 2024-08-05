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
        }

        nav a {
            color: #2c3e50;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #e74c3c;
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
        footer a{
            color: wheat;
        }
         table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        button:hover{
            background-color: #ff3333;
        }
    </style>
</head>
<body>
    <header>Welcome To Student Request Portal Management System</header>
    <nav>
        <a href="AdminHome.jsp">Home</a>
        <a href="AdminQuestion.jsp">Request-List</a>
        <a href="Pending.jsp">Pending-Request</a>
        <a href="DisplayUser.jsp">Students</a>
        <a href="DisplayPro.jsp">Staff</a>
        <a href="Logout">Logout</a>
    </nav>
    <br>
    <center>
    <p style="color: #2c3e50; padding: 10px; font-weight: bold; transition: color 0.3s;">Those are The Student</p>
    <form action="searchstu.jsp" method="POST">
    <input type="text" name="sea" placeholder="Search a Student Here!" required/>
    <input type="submit" value="Search">
    </form>
    <main>
    <table>
        <tr>
            <th>Registration-Number</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Username</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
        <%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap","root","");
        String sql = "SELECT * FROM user";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
        int id= rs.getInt(1);
        %>
        <tr>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><button style="background-color: #339900; font-weight: bold; border: none; height: 40px; color: white;"><a href="UserEdit.jsp?id=<%= id%>" style="color: white;">Edit</a></button>
                <button style="background-color: #cc0000; font-weight: bold; border: none; height: 40px; color: white;"><a href="UserDelete.jsp?id=<%= id%>" style="color: white;">Delete</a></button>
            </td>
        </tr>
        <%
        
            }
}
catch(Exception ex){
  ex.printStackTrace();
}
        %>
    </table>
        </main>
    </center>
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

