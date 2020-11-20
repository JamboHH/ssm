<%--
  Created by IntelliJ IDEA.
  User: 高美林
  Date: 2020/11/20
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script src="webjars/jquery/3.1.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<html>
<head>
    <title>商品列表</title>
    <style>
        #bb {
            background-color: rgba(218, 219, 226, 0.5);
        }
    </style>
</head>
<body id="bb">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover text-center">
                <tr>
                    <%--添加--%>
                    <td colspan="7">
                        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addModal">
                            添加商品
                        </button>
                        <%--弹出模态框--%>
                        <div class="modal fade" id="addModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/goods/addGoods" method="post" class="form-horizontal"
                                              enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">商品名称</label>
                                                <div class="col-md-10">
                                                    <input type="text" name="name" class="form-control">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label">商品图片</label>
                                                <div class="col-md-10">
                                                    <input type="file" name="file" class="form-control">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-2 control-label">店铺名称</label>
                                                <div class="col-md-10">
                                                    <input type="text" name="des" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">商品价钱</label>
                                                <div class="col-md-10">
                                                    <input type="text" name="price" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-2 control-label">商品折扣</label>
                                                <div class="col-md-10">
                                                    <input type="text" name="discount" class="form-control">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">添加</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="danger">商品序号</td>
                    <td class="success">商品名称</td>
                    <td class="info">商品图片</td>
                    <td class="active">商品店名</td>
                    <td class="info">商品价钱</td>
                    <td class="success">商品折扣</td>
                    <td class="info">操作</td>
                </tr>
                <c:forEach items="${list}" var="goods">
                    <tr>
                        <td>${goods.id}</td>
                        <td>${goods.name}</td>
                        <td><img src="${goods.pic}" style="width: 100px;height: 140px"></td>
                        <td>${goods.des}</td>
                        <td>${goods.price}</td>
                        <td>${goods.discount}</td>
                        <td>
                            <a href="/goods/deleteGoods?id=${goods.id}">
                                <button class="btn btn-danger btn-sm delete">删除</button>
                            </a>
                            <button class="btn btn-default btn-sm" data-toggle="modal"
                                    data-target="#myModal${goods.id}">修改
                            </button>
                                <%--弹出模态框--%>
                            <div class="modal fade" tabindex="-1" role="dialog" id="myModal${goods.id}">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">x</span></button>
                                            <h4 class="modal-title" id="gridSystemModalLabel">修改信息</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/goods/updateGoods" method="post" class="form-horizontal"
                                                  enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label"></label>
                                                    <div class="col-md-10">
                                                        <input type="hidden" name="id" value="${goods.id}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">商品名称</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="name" class="form-control"
                                                               value="${goods.name}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">商品图片</label>
                                                    <div class="col-md-10">
                                                        <input type="file" name="file" class="form-control"
                                                               value="${goods.pic}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">商品价钱</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="price" class="form-control"
                                                               value="${goods.price}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">店铺名称</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="des" class="form-control"
                                                               value="${goods.des}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">商品折扣</label>
                                                    <div class="col-md-10">
                                                        <input type="text" name="discount" class="form-control"
                                                               value="${goods.discount}">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary update">修改</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <%--分页--%>
                    <td colspan="7">
                        <ul class="pagination">
                            <li><a href="/goods/findAll?page=1">首页</a></li>
                            <li <c:if test="${pageInfo.pageNum==1}">class="disabled"</c:if>><a
                                    href="/goods/findAll?page=${pageInfo.pageNum-1 }">«</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="pageNo">
                                <li <c:if test="${pageInfo.pageNum==pageNo}">class="active"</c:if>><a
                                        href="/goods/findAll?page=${pageNo}">${pageNo}</a></li>
                            </c:forEach>
                            <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled"</c:if>><a
                                    href="/goods/findAll?page=${pageInfo.pageNum+1}">»</a></li>
                            <li><a href="/goods/findAll?page=${page.pages }">尾页</a></li>
                        </ul>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
