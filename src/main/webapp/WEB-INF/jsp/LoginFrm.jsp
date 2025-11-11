<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập - Cineman</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
      }

      .page-title {
        font-size: 48px;
        font-weight: bold;
        color: #667eea;
        margin-bottom: 30px;
        text-align: center;
      }

      .login-container {
        background-color: white;
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        max-width: 400px;
        width: 100%;
      }

      .logo {
        text-align: center;
        margin-bottom: 30px;
      }

      .logo h1 {
        font-size: 36px;
        color: #667eea;
        margin-bottom: 10px;
      }

      .logo p {
        color: #666;
        font-size: 14px;
      }

      .form-group {
        margin-bottom: 25px;
      }

      label {
        display: block;
        margin-bottom: 8px;
        color: #333;
        font-weight: 500;
      }

      input[type="text"],
      input[type="password"] {
        width: 100%;
        padding: 12px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color 0.3s;
      }

      input[type="text"]:focus,
      input[type="password"]:focus {
        outline: none;
        border-color: #667eea;
      }

      .remember-me {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
      }

      .remember-me input[type="checkbox"] {
        margin-right: 8px;
      }

      .remember-me label {
        margin-bottom: 0;
        font-weight: normal;
        color: #666;
      }

      .btn-login {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: transform 0.2s;
      }

      .btn-login:hover {
        transform: translateY(-2px);
      }

      .error-message {
        background-color: #fee;
        color: #c33;
        padding: 12px;
        border-radius: 8px;
        margin-bottom: 20px;
        font-size: 14px;
        border-left: 4px solid #c33;
      }

      .links {
        text-align: center;
        margin-top: 20px;
      }

      .links a {
        color: #667eea;
        text-decoration: none;
        font-size: 14px;
      }

      .links a:hover {
        text-decoration: underline;
      }

      .divider {
        text-align: center;
        margin: 20px 0;
        color: #999;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">HỆ THỐNG RẠP CHIẾU PHIM</h1>
    <div class="login-container">
      <div class="logo">
        <h1>🎬 CINEMAN</h1>
        <p>Đăng nhập để tiếp tục</p>
      </div>

      <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
          <label for="username">Tên đăng nhập</label>
          <input
            type="text"
            id="username"
            name="username"
            value="${username}"
            required
            placeholder="Nhập tên đăng nhập"
          />
        </div>

        <div class="form-group">
          <label for="password">Mật khẩu</label>
          <input
            type="password"
            id="password"
            name="password"
            required
            placeholder="Nhập mật khẩu"
          />
        </div>

        <button type="submit" class="btn-login">Đăng nhập</button>
      </form>
    </div>
  </body>
</html>
