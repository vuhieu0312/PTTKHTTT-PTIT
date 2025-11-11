<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thống kê khách hàng - Cineman</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-color: white;
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
        max-width: 1200px;
        margin: 0 auto;
        background: white;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }
      h1 {
        color: #667eea;
        margin-bottom: 30px;
      }
      .filter-box {
        display: flex;
        gap: 15px;
        margin-bottom: 30px;
        align-items: center;
      }
      .filter-box label {
        font-weight: 600;
      }
      .filter-box input[type="date"] {
        padding: 10px;
        border: 2px solid #e0e0e0;
        border-radius: 5px;
      }
      .filter-box button {
        padding: 10px 30px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        border: 1px solid #ddd;
      }
      th,
      td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ddd;
      }
      th {
        background-color: #667eea;
        color: white;
        border: 1px solid #667eea;
      }
      tr:hover {
        background-color: #f5f5ff;
        cursor: pointer;
      }
      .back-btn {
        margin-top: 20px;
      }
      .btn {
        display: inline-block;
        padding: 10px 20px;
        background: #999;
        color: white;
        text-decoration: none;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">HỆ THỐNG RẠP CHIẾU PHIM</h1>
    <div class="container">
      <h1>ClientStatisticView</h1>

      <!-- Filter form theo diagram -->
      <form
        action="${pageContext.request.contextPath}/clientstatistic"
        method="get"
        class="filter-box"
      >
        <label>Bắt đầu:</label>
        <input type="date" name="startDate" value="${startDate}" required />

        <label>Kết thúc:</label>
        <input type="date" name="endDate" value="${endDate}" required />

        <button type="submit" id="btnSearch">Tìm kiếm</button>
      </form>

      <!-- Results table theo diagram -->
      <c:if test="${not empty ListClientStatistic}">
        <table>
          <thead>
            <tr>
              <th>Tên khách hàng</th>
              <th>Số điện thoại</th>
              <th>Tổng doanh thu</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="stat" items="${ListClientStatistic}">
              <tr
                onclick="location.href='${pageContext.request.contextPath}/bill?clientId=${stat.clientId}&startDate=${startDate}&endDate=${endDate}'"
              >
                <td>${stat.name}</td>
                <td>${stat.phoneNumber}</td>
                <td>
                  <fmt:formatNumber
                    value="${stat.totalRevenue}"
                    type="number"
                    groupingUsed="true"
                  />
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

      <div class="back-btn">
        <button onclick="history.back()" class="btn" id="btnBack">
          Quay lại
        </button>
      </div>
    </div>
  </body>
</html>
