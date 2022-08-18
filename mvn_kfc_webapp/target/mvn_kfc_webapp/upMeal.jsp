<%--
  Created by IntelliJ IDEA.
  User: makexin
  Date: 2022/7/24
  Time: 9:16
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
        $("#upMeal").click(function (){
            $("form[name=upForm]").ajaxSubmit(function (obj){
                if(obj>0){
                    alert("修改成功");
                    location="queryMeal.do";
                }else{
                    alert("修改失败");
                }
            })
        })
    })
</script>
<body>
<form name="upForm" action="up.do" method="post">
    <input type="hidden" name="mid" value="${meal.mid}">
    套餐名称:<input type="text" name="mname" value="${meal.mname}">
    套餐价格：<input type="text" name="price" value="${meal.price}">
    创建时间:<input type="date" name="CDate" value="<fmt:formatDate value="${meal.CDate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
    <br>
    请选择食品:
    <br>
    <c:forEach items="${foods}" var="f">
        ${f.fname}  <input type="checkbox" ${f.mid>0?"checked":""} name="fids" value="${f.fid}"> |
    </c:forEach>
    <br>
    <input type="button" id="upMeal" value="修改">
</form>
</body>
</html>
