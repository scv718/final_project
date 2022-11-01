<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ include file="../../../header.jsp"%>
    <style>
        .li_board ul {
            list-style: none;
            margin-bottom: 0;
            clear: both;
            display: table-row-group;
            padding-left: 0;
        }

        .li_board ul li {
            padding-top: 15px;
            padding-bottom: 15px;
            padding-left: 7px;
            padding-right: 7px;
        }

        .li_board ul li {
            border: 1px solid #D7D7D7;
        }

        .li_board ul li {
            text-align: center;
            display: table-cell;
            vertical-align: middle;
            padding-top: 10px;
            padding-bottom: 10px;
            border-width: 0 0 1px 0;
            border-style: solid;
        }

        a {
            color: black;
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .li_board ul {
                padding: 10px 15px 15px 15px;
                display: block;
                border-width: 0 0 1px 0;
                border-style: solid;
            }
        }

        @media (max-width: 768px) {

            .li_board ul li.read,
            .li_board ul li.date,
            .li_board ul li.name,
            .li_board ul li.time,
            .li_board ul li.like {
                display: table-cell;
                width: auto !important;
                padding: 5px 10px 0 0;
                font-size: 12px;
                height: 12px;
                line-height: 12px !important;
                margin-top: 8px;
            }
        }

        @media (max-width: 768px) {
            .li_board ul li.tit {
                display: block;
                float: none;
                width: 100%;
                font-size: 15px;
                position: relative;
                padding: 0 !important;
                line-height: 1.4;
            }
        }

        @media (max-width: 767px) {
            .hidden-xs {
                display: none !important;
            }
        }
    </style>
    <script>
    function selTr(val){
    	location.href = "getNotice.wp?commu_no="+val;
    }

    </script>
</head>

<body>
    <div class="li_board">
        <ul class="li_header hidden-xs">
            <li class="no">No</li>
            <li class="tit">제목</li>
            <li class="name">글쓴이</li>
            <li class="date">작성시간</li>
            <li class="read">조회수</li>
        </ul>

	<c:forEach var="notice" items="${noticeList}">
        <ul class="li_body notice_body" onclick="selTr(${notice.commu_no})" style="cursor:pointer;" >
<!--         <ul class="li_body notice_body" > -->
            <li class="no">${notice.commu_cat_no}</li>
            <li class="tit">
<%--                 <a class="" href="getNotice.wp?commu_no=${notice.commu_no}" > --%>
                    <span>${notice.commu_title}</span>
<!--                 </a> -->
            </li>
            <li class="name">${notice.id}</li>
            <li class="time">${notice.commu_date}</li>
            <li class="read">
                <span class="hidden-lg hidden-md hidden-sm ">조회수</span>${notice.commu_count}
            </li>
        </ul>
	</c:forEach>

    </div>
    <%@ include file="../../../footer.jsp" %>
</body>

</html>