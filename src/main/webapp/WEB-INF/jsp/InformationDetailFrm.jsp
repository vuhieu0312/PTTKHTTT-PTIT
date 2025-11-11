<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi tiết phim - Cineman</title>
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
        max-width: 800px;
        margin: 0 auto;
        background: white;
        border-radius: 10px;
        padding: 40px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }
      h1 {
        color: #667eea;
        margin-bottom: 30px;
        text-align: center;
      }
      .info-table {
        width: 100%;
        border-collapse: collapse;
      }
      .info-table th {
        background-color: #f8f8f8;
        padding: 15px;
        text-align: left;
        width: 180px;
        border: 1px solid #e0e0e0;
        font-weight: 600;
      }
      .info-table td {
        padding: 15px;
        border: 1px solid #e0e0e0;
      }
      .back-btn {
        margin-top: 30px;
        text-align: center;
      }
      .btn {
        display: inline-block;
        padding: 12px 30px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: transform 0.3s;
      }
      .btn:hover {
        transform: translateY(-2px);
      }
      .loading {
        text-align: center;
        padding: 40px;
        color: #999;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">HỆ THỐNG RẠP CHIẾU PHIM</h1>
    <div class="container">
      <h1>Thông tin chi tiết phim</h1>

      <div id="loading" class="loading">Đang tải thông tin...</div>

      <table id="movieDetail" class="info-table" style="display: none">
        <tr>
          <th>Tên phim</th>
          <td id="movieName"></td>
        </tr>
        <tr>
          <th>Thể loại</th>
          <td id="movieGenre"></td>
        </tr>
        <tr>
          <th>Thời lượng</th>
          <td id="movieDuration"></td>
        </tr>
        <tr>
          <th>Ngôn ngữ</th>
          <td id="movieLanguage"></td>
        </tr>
        <tr>
          <th>Ngày khởi chiếu</th>
          <td id="movieReleaseDate"></td>
        </tr>
        <tr>
          <th>Mô tả</th>
          <td id="movieDescription"></td>
        </tr>
      </table>

      <div class="back-btn">
        <a href="javascript:history.back()" class="btn">Quay lại</a>
      </div>
    </div>

    <script>
      //lấy id movie từ url
      const urlParams = new URLSearchParams(window.location.search);
      const movieId = urlParams.get("idMovie");

      if (movieId) {
        fetch(
          "${pageContext.request.contextPath}/movie?action=detail&idMovie=" +
            movieId
        )
          .then((response) => response.json())
          .then((movie) => {
            displayMovieDetail(movie);
          })
          .catch((error) => {
            console.error("Error:", error);
            document.getElementById("loading").textContent =
              "Lỗi khi tải thông tin phim!";
          });
      } else {
        document.getElementById("loading").textContent =
          "Không tìm thấy mã phim!";
      }

      function displayMovieDetail(movie) {
        document.getElementById("loading").style.display = "none";
        document.getElementById("movieDetail").style.display = "table";

        document.getElementById("movieName").textContent = movie.name || "";
        document.getElementById("movieGenre").textContent = movie.genre || "";
        document.getElementById("movieDuration").textContent =
          (movie.duration || "") + " phút";
        document.getElementById("movieLanguage").textContent =
          movie.language || "";
        document.getElementById("movieReleaseDate").textContent = formatDate(
          movie.releaseDate
        );
        document.getElementById("movieDescription").textContent =
          movie.description || "";
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
