<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession sessions = request.getSession(false);
    String uname = (String) sessions.getAttribute("uname");

    if (uname == null) {
        response.sendRedirect("ProLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome To SRPMS</title>
    <link rel="icon" href="/RP-USAP/icon/icon.jpeg" type="image/x-icon">
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

        nav a:hover {
            color: #e74c3c;
        }
        footer a {
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
    </style>
</head>
<body>
    <header>Welcome To Student Request Portal Management System</header>
    <nav>
        <a href="ProHome.jsp">Home</a>
        <a href="Approved.jsp">Completed-Request</a>
        <a href="Answer.jsp">Pending-Request</a>
        <a href="/RP-USAP/index.html">Logout</a>
    </nav>
    <br>
    <center>
        <p style="color: #2c3e50; padding: 10px; font-weight: bold;">The Available Requests For You Are:</p>
        <main>
            <table>
                <tr>
                    <th>Request Description</th>
                    <th>Student</th>
                    <th>Action</th>
                </tr>
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rp_usap", "root", "");
                    String query = "SELECT type FROM professionor WHERE Username = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, uname);
                    ResultSet rs = ps.executeQuery();

                    String ids = "";
                    if (rs.next()) {
                        ids = rs.getString("type");
                    }

                    String sql = "SELECT user.Firstname, questions.qid, questions.Description " +
                                 "FROM user " +
                                 "JOIN questions ON user.uid = questions.uid " +
                                 "LEFT JOIN answers ON questions.qid = answers.qid " +
                                 "WHERE answers.qid IS NULL AND questions.Staff = ?";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, ids);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String id = String.valueOf(rs.getInt("qid"));
                %>
                <tr>
                    <td><%= rs.getString("Description") %></td>
                    <td><%= rs.getString("Firstname") %></td>
                    <td><button style="background-color: #339900; border: none; height: 40px;">
                        <a href="feedback.jsp?id=<%= id %>" style="color: white;">Feedback</a>
                    </button></td>
                </tr>
                <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                %>
            </table>
        </main>
    </center>
    <footer>
        This Is Student Request Portal Management System!!!<br>
        You Can Contact Us at:<br>
        Email: <a href="mailto:studentaffairs@gmail.com">studentaffairs@gmail.com</a><br>
        Call: +250790673235<br>
        Website: <a href="https://www.rp.ac.rw/">RP-Website</a><br>
        &copy;Balinda 2024!
    </footer>
</body>
</html>
