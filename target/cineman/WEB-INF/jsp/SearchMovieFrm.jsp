<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tìm kiếm phim - Cineman</title>
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
      .search-box {
        display: flex;
        gap: 10px;
        margin-bottom: 30px;
      }
      .search-box input {
        flex: 1;
        padding: 12px;
        border: 2px solid #e0e0e0;
        border-radius: 5px;
        font-size: 16px;
      }
      .search-box button {
        padding: 12px 30px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
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
      .no-data {
        text-align: center;
        padding: 40px;
        color: #999;
      }
      .btn-back {
        display: inline-block;
        padding: 12px 30px;
        background: #999;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
        margin-top: 20px;
        border: none;
        cursor: pointer;
      }
      .btn-back:hover {
        background: #777;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">HỆ THỐNG RẠP CHIẾU PHIM</h1>
    <div class="container">
      <h1>SearchMovieView</h1>

      <!-- Search form: AJAX call to servlet -->
      <div class="search-box">
        <input type="text" id="txtMovieName" placeholder="Nhập tên phim..." />
        <button type="button" id="btnSearch" onclick="searchMovie()">
          Tìm kiếm
        </button>
      </div>

      <!-- Results table -->
      <table id="tblResults" style="display: none">
        <thead>
          <tr>
            <th>ID Phim</th>
            <th>Tên phim</th>
            <th>Ngày khởi chiếu</th>
          </tr>
        </thead>
        <tbody id="movieResults"></tbody>
      </table>

      <div id="noData" class="no-data">Đang tải danh sách phim...</div>

      <button onclick="history.back()" class="btn-back" id="btnBack">
        Quay lại
      </button>
    </div>

    <script>
      window.addEventListener("DOMContentLoaded", function () {
        loadAllMovies();
      });

      function loadAllMovies() {
        fetch("${pageContext.request.contextPath}/movie?action=all")
          .then((response) => response.json())
          .then((data) => {
            displayResults(data);
          })
          .catch((error) => {
            console.error("Error:", error);
            document.getElementById("noData").textContent =
              "Lỗi khi tải danh sách phim!";
          });
      }

      function searchMovie() {
        const movieName = document.getElementById("txtMovieName").value.trim();

        if (!movieName) {
          loadAllMovies();
          return;
        }
        fetch(
          "${pageContext.request.contextPath}/movie?action=search&Name=" +
            encodeURIComponent(movieName)
        )
          .then((response) => response.json())
          .then((data) => {
            displayResults(data);
          })
          .catch((error) => {
            console.error("Error:", error);
            document.getElementById("noData").textContent = "Lỗi khi tìm kiếm!";
          });
      }

      function displayResults(movies) {
        const tbody = document.getElementById("movieResults");
        const table = document.getElementById("tblResults");
        const noData = document.getElementById("noData");

        tbody.innerHTML = "";

        if (movies && movies.length > 0) {
          table.style.display = "table";
          noData.style.display = "none";

          movies.forEach((movie) => {
            const tr = document.createElement("tr");
            tr.onclick = () => viewDetail(movie.id);

            // Column 1: ID Phim
            // Column 2: Tên phim
            // Column 3: Ngày khởi chiếu (format dd/MM/yyyy)
            const releaseDateText = formatDate(movie.releaseDate);
            tr.innerHTML =
              "<td>" + movie.id + "</td><td>" + movie.name + "</td><td>" + releaseDateText + "</td>";
            tbody.appendChild(tr);
          });
        } else {
          table.style.display = "none";
          noData.style.display = "block";
          noData.textContent = "Không tìm thấy phim nào!";
        }
      }

      function viewDetail(movieId) {
        // Chuyển hướng đến trang chi tiết phim
        window.location.href = "${pageContext.request.contextPath}/movie?action=viewDetail&idMovie=" + movieId;
      }

      function formatDate(dateStr) {
        if (!dateStr) return "";
        const date = new Date(dateStr);
        const day = String(date.getDate()).padStart(2, "0");
        const month = String(date.getMonth() + 1).padStart(2, "0");
        const year = date.getFullYear();
        return day + "/" + month + "/" + year;
      }
    </script>
  </body>
</html>
