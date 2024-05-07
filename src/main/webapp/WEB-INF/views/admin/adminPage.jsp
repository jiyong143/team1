<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>admin_page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #C0C0C0;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: red;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: black;
  color: white;
}

.media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

.media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
[class^=box]{ 
    width: 400px; height: 300px; border: 1px solid black; margin: 10px; background-color: green;
}
.box3{ display: inline-block;}

.Manager-container{width: 600px; height:auto; margin-left: 220px;}

.myChart{width: 200px; height: 200px; margin-left: 1000px;}
</style>
</head>
<body>
<div class="sidebar">
  <a class="active" href="#home">사이트 정보</a>
  <a href="/team1/admin/memberManager">회원 관리</a>
  <a href="/team1/report/list">신고관리</a>
  <a href="/team1/admin/inquityManager">카테고리 관리</a>
  <a href="/team1/admin/topCategoryManager">대분류 관리</a>
  <a href="/team1/admin/midCategoryManager">중분류 관리</a>

</div>
<div class="Manager-container">
  <h2>메니저 명단</h2>
  <p><a href="/team1/admin/memberManagement">회원 관리 바로가기</a></p>           
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>권한</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${member.me_id}</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
<div class="Manager-container">
  <h2>최근 신고내역</h2>
  <p><a href="#">신고 관리 바로가기</a></p>            
  <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
<script>
const xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
const yValues = [55, 49, 44, 24, 15];
const barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];

new Chart("myChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "World Wide Wine Production 2018"
    }
  }
});
</script>
</body>
</html>