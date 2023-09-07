<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 20px;
        }

        h1 {
            font-size: 24px;
        }

        .options {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .option {
            flex: 1;
            padding: 20px;
        }

        h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Are you?</h1>
        <div class="options">
            <div class="option">
                <h2>Admin</h2>
                <a href="BookServlet">Click Here</a>
            </div>
            <div class="option">
                <h2>User</h2>
                <a href="BookServlet?id=user">Click Here</a>
            </div>
        </div>
    </div>
</body>
</html>
