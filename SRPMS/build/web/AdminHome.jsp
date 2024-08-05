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
        <a href="AdminHome.jsp">Home</a>
        <a href="AdminQuestion.jsp">Request-List</a>
        <a href="Pending.jsp">Pending-Request</a>
        <a href="DisplayUser.jsp">Students</a>
        <a href="DisplayPro.jsp">Staff</a>
        <a href="Logout">Logout</a>
    </nav>
        <div class="content">
        <center>
        <h2>Welcome, Director!</h2>
        <hr></hr>
        </center>
        
    <p>We extend our warmest greetings to you as you step into the administrative realm of our digital domain. 
        Your presence here is pivotal, for you hold the keys to unlocking a world of possibilities. 
        As the steward of this virtual realm, you'll navigate through the intricate tapestry of data 
        and commands that shape our digital landscape. Your efforts will sculpt the user experience, 
        ensuring that every interaction is seamless, secure, and enriching. With your guidance, 
        our systems will hum with efficiency, and our online community will thrive. 
        So here's to the challenges and triumphs that await, and to the vital role you'll play in 
        steering our digital destiny. Welcome, Admin, to a realm of boundless potential!</p>
    </div>
    <br><br><br><br><br>
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

