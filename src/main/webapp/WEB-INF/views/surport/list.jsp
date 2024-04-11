<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
<div class="left_bx" style="height: 1011px;">
    <a href="javascript:_goToHome();" class="online_help" id="onlineConsult">온라인상담</a>
    <ul class="game_left_menu">
    </ul>
    <ul class="game_my_menu"> 
     <li>
         <a href="javascript:_gotoMyHistory();" class="menu01" id="myHistory">내 문의내역</a>
     </li>
        <li>
            <a href="javascript:_gotoMessageBox()" class="menu02" id="messageBox">메시지함</a>
        </li>       
    </ul>
</div>

</body>
</html>