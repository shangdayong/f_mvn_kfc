<%--
  Created by IntelliJ IDEA.
  User: makexin
  Date: 2022/7/23
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
        $("#delM").click(function (){
            $("form[name=delForm]").ajaxSubmit(function (obj){
                if(obj>0){
                    alert("删除成功");
                    location="queryMeal.do";
                }else{
                    alert("删除失败");
                }
            })
        })
    })
    $(function (){
        $("#delM").click(function () {
            $("form[name=delForm]").ajaxSubmit(function (obj) {
                if(obj>0){
                    alert("删除成功");
                    location="queryMeal.do";
                }
            })
        })
    })
</script>
<body>
<table>
    <tr>
        <td><input type="checkbox" name="seCcheck"></td>
        <td>套餐名称</td>

        <td>套餐价格</td>

        <td>套餐创建时间</td>

        <td>套餐食品数量</td>
        <td>套餐食品详解</td>
        <td>套餐食品价格详解</td>
        <td>操作</td>
    </tr>
    <form method="post" name="delForm" action="delMeal.do">
        <c:forEach var="m" items="${page.list}">
            <tr>
                <td><input type="checkbox" name="ids" value="${m.mid}"></td>
                <td>${m.mname}</td>

                <td>${m.price}</td>

                <td><fmt:formatDate value="${m.CDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>

                <td>${m.sl}</td>
                <td>${m.fnames}</td>
                <td>${m.prices}</td>
                <td> <a href="<%=request.getContextPath()%>/queryOne.do?mid=${m.mid}">[修改]</a></td>
            </tr>
        </c:forEach>
    </form>
    <tr>
        <td colspan="8">
            当前第 ${page.pageNum} 页，共  ${page.pages} 页，共  ${page.total} 条
            <a href="<%=request.getContextPath()%>/queryMeal.do?pageNum=1">[首页]</a>
            <a href="<%=request.getContextPath()%>/queryMeal.do?pageNum=${page.prePage}">[上一页]</a>
            <a href="<%=request.getContextPath()%>/queryMeal.do?pageNum=${page.nextPage}">[下一页]</a>
            <a href="<%=request.getContextPath()%>/queryMeal.do?pageNum=${page.pages}">[尾页]</a>
            |<input type="button" id="delM" value="批量删除">
        </td>
    </tr>
</table>
</body>
</html>

