<%--
  Created by IntelliJ IDEA.
  User: Mrs
  Date: 2022/7/24
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
    <link href="<%=request.getContextPath()%>/css/index_work.css" rel="stylesheet">
</head>
<script>
    $(function(){
        $("#addMeal").click(function (){
            $("form[name=addForm]").ajaxSubmit(function (obj){
                if(obj>0){
                    alert("添加成功");
                    location="queryMeal.do";
                }else{
                    alert("添加失败");
                }
            })
        })
    })
</script>
<body>
<form name="addForm" action="add.do" method="post">
    套餐名称：<input type="text" name="mname" >
    套餐价格：<input type="text" name="price">
    创建时间：<input type="date" name="CDate">
    <br>
<c:forEach items="${foods}" var="f">
    ${f.fname} <input type="checkbox" name="fids" value="${f.fid}">
</c:forEach>
<br>
<input type="button" id="addMeal" value="添加">
</form>
</body>
</html>
