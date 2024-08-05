<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
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
        footer a{
            color: wheat;
        }
        .content {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .content p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .content h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <header>Welcome To Student Request Portal Management System</header>
    <nav>
        <a href="Professionor/ProHome.jsp">Home</a>
        <a href="Approved.jsp">Completed-Request</a>
        <a href="Answer.jsp">Pending-Request</a>
        <a href="/RP-USAP/index.html">Logout</a>
    </nav>
    <div class="content">
        <center>
            <h2>Welcome, <%= uname %>!</h2>
            <hr>
            <p>
                This is the page for professors. You are authorized to access this page. Feel free to answer questions requested by students. Make sure they are satisfied with your response. They will ask you various questions and challenges related to their courses. This is a simple way to solve their problems and encourage them in their learning during your responsibility as a facilitator. Provide guidance, feedback, and support to students.
            </p>
        </center>
    </div>
    <footer>
        This is the Student Request Portal Management System!!!<br>
        You can contact us at:<br>
        Email: <a href="mailto:studentaffairs@gmail.com">studentaffairs@gmail.com</a><br>
        Call: +250790673235<br>
        Website: <a href="https://www.rp.ac.rw/">RP-Website</a><br>
        &copy;Balinda 2024!
    </footer>
</body>
</html>
