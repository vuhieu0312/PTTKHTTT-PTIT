<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang chủ Khách hàng - Cineman</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: white;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 20px;
      }
      .page-title {
        font-size: 48px;
        font-weight: bold;
        color: #667eea;
        margin-bottom: 30px;
        text-align: center;
      }
      .container {
        background: white;
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        max-width: 500px;
        width: 100%;
        text-align: center;
      }
      h1 {
        color: #667eea;
        margin-bottom: 30px;
        font-size: 32px;
      }
      .welcome {
        margin-bottom: 30px;
        color: #666;
      }
      .btn {
        display: inline-block;
        padding: 15px 40px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-decoration: none;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        transition: transform 0.3s;
        border: none;
        cursor: pointer;
      }
      .btn:hover {
        transform: translateY(-3px);
      }
      .btn-logout {
        background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">HỆ THỐNG RẠP CHIẾU PHIM</h1>
    <div class="container">
      <h1>🎬 CINEMAN</h1>
      <div class="welcome">
        <p>Xin chào, <strong>${sessionScope.user.name}</strong></p>
        <p>Chào mừng đến với hệ thống rạp chiếu phim!</p>
      </div>

      <a
        href="${pageContext.request.contextPath}/movie"
        class="btn"
        id="btnSearchMovie"
      >
        Tìm kiếm thông tin phim
      </a>

      <a
        href="${pageContext.request.contextPath}/logout"
        class="btn btn-logout"
        id="btnLogout"
      >
        Đăng xuất
      </a>
    </div>
  </body>
</html>
