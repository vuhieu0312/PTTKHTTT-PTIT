<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi tiết hóa đơn - Cineman</title>
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
        max-width: 1000px;
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
      .total-row {
        font-weight: bold;
        background-color: #f8f8f8;
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
        border: none;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">HỆ THỐNG RẠP CHIẾU PHIM</h1>
    <div class="container">
      <h1>ClientStatisticDetailView</h1>

      <c:if test="${not empty clientName}">
        <p style="margin-bottom: 20px; font-size: 18px">
          <strong>Khách hàng: ${clientName}</strong>
        </p>
      </c:if>

      <c:if test="${not empty ListBill}">
        <table>
          <thead>
            <tr>
              <th>Mã hóa đơn</th>
              <th>Ngày tạo</th>
              <th>Tổng tiền (VNĐ)</th>
            </tr>
          </thead>
          <tbody>
            <c:set var="totalSum" value="0" />
            <c:forEach var="bill" items="${ListBill}">
              <tr>
                <td>${bill.id}</td>
                <td>
                  <fmt:formatDate
                    value="${bill.createDate}"
                    pattern="dd/MM/yyyy"
                  />
                </td>
                <td>
                  <fmt:formatNumber
                    value="${bill.totalPrice}"
                    type="number"
                    groupingUsed="true"
                  />
                </td>
              </tr>
              <c:set var="totalSum" value="${totalSum + bill.totalPrice}" />
            </c:forEach>
            <tr class="total-row">
              <td colspan="2">Tổng cộng</td>
              <td>
                <fmt:formatNumber
                  value="${totalSum}"
                  type="number"
                  groupingUsed="true"
                />
              </td>
            </tr>
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
