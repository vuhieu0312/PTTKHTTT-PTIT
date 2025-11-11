<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chọn thống kê - Cineman</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding-top: 80px;
        padding-bottom: 20px;
        padding-left: 20px;
        padding-right: 20px;
      }
      .fixed-header {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background: #fff8dc;
        color: #333;
        padding: 20px;
        text-align: center;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        z-index: 1000;
      }
      .fixed-header h1 {
        font-size: 32px;
        font-weight: bold;
        margin: 0;
        color: #333;
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
        color: #333;
        margin-bottom: 30px;
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
        margin: 10px;
        transition: transform 0.3s;
        border: none;
        cursor: pointer;
      }
      .btn:hover {
        transform: translateY(-3px);
      }
      .btn-back {
        background: #999;
      }
    </style>
  </head>
  <body>
    <div class="fixed-header">
      <h1>HỆ THỐNG RẠP CHIẾU PHIM</h1>
    </div>
    <div class="container">
      <h1>Chọn loại thống kê</h1>

      <form
        action="${pageContext.request.contextPath}/clientstatistic"
        method="get"
      >
        <button type="submit" class="btn" id="btnViewClientStatistic">
          Thống kê khách hàng theo doanh thu
        </button>
      </form>

      <br />
      <button onclick="history.back()" class="btn btn-back" id="btnBack">
        Quay lại
      </button>
    </div>
  </body>
</html>
