<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.edu.neusoft.fawutong.domain.News" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>法务通后台管理</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/wxcss.css" rel="stylesheet" />
 <style type="text/css">
        body {
            font-family: "Microsoft Yahei","helvetica", "Arial";
            font-size: 14px;
            color: #333;
            overflow-y: scroll;
            padding-top: 16px;
            padding-bottom: 16px;
        }
        
    </style>
    
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    
    </script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<jsp:include page="admin_Nav.jsp" />
	<jsp:include page="admin_left.jsp" />
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">资讯管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">资讯管理</h1>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">资讯管理</div>
				<div class="panel-body">
					<div class="bootstrap-table">
						<div class="fixed-table-toolbar">
							<div class="columns btn-group pull-right"><button id="search" class="btn btn-default" type="button" name="refresh" title="Refresh"><i class="glyphicon glyphicon-refresh icon-refresh"></i></button>
								<!-- <button class="btn btn-default" type="button" name="toggle" title="Toggle"><i class="glyphicon glyphicon glyphicon-list-alt icon-list-alt"></i></button>
								<div class="keep-open btn-group" title="Columns"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-th icon-th"></i> <span class="caret"></span></button>
								</div> -->
							</div>
							<div class="pull-right search"><input id="searchValue" class="form-control" type="text" placeholder="输入标题"></div>
						</div>
						<div class="fixed-table-container" style="padding-bottom: 0px;">
							<div class="fixed-table-header" style="display: block;">
								<table></table>
							</div>
							<div class="fixed-table-body">
								<div class="fixed-table-loading" style="top: 37px; display: none;">Loading, please wait…</div>
								<table data-toggle="table" data-url="tables/data1.json" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc" class="table table-hover" style="margin-top: 0px;">
									<thead style="display: table-header-group;">
										<tr>
											<!-- <th class="bs-checkbox " style="width: 36px; ">
												<div class="th-inner "><input name="btSelectAll" type="checkbox"></div>
												<div class="fht-cell"></div>
											</th> -->
											<th style="">
												<div class="th-inner sortable">资讯编号</div>
												<div class="fht-cell"></div>
											</th>
											<th style="">
												<div class="th-inner sortable">标题</div>
												<div class="fht-cell"></div>
											</th>
											<th style="">
												<div class="th-inner sortable">类型</div>
												<div class="fht-cell"></div>
											</th>
											<th style="">
												<div class="th-inner sortable">来源</div>
												<div class="fht-cell"></div>
											</th>
											<th style="">
												<div class="th-inner sortable">概述</div>
												<div class="fht-cell"></div>
											</th>
											<th style="">
												<div class="th-inner sortable">发布日期</div>
												<div class="fht-cell"></div>
											</th>
											<!-- <th style="">
												<div class="th-inner sortable">建议详情_id</div>
												<div class="fht-cell"></div>
											</th> -->
											<th style="">
												<div class="th-inner ">修改</div>
												<div class="fht-cell"></div>
											</th>
											<th style="">
												<div class="th-inner ">删除</div>
												<div class="fht-cell"></div>
											</th>
										</tr>
									</thead>
									<tbody id="cell">
 								 	<c:forEach items="${news}" var="n">
										<tr data-index="0">
											<!-- <td class="bs-checkbox"><input data-index="0" name="toolbar1" type="checkbox"></td> -->
											<td style="">${n.nid }</td>
											<td style="">${n.ntitle }</td>
											<td style="">${n.ntype }</td>
											<td style="">${n.nsource }</td>
											<td style="">${n.ncontext }</td>
											<td style="">${n.ndate }</td>
											<td style="">
												<a id="modal-85878" href="newsChange.html?id=${n.nid }" role="button"  data-toggle="modal">修改</a>
												
											</td>
											<td style="">
												
												<a id="modal-85878" href="#modal-container-85878_${n.nid }" role="button"  data-toggle="modal">删除</a>
				                    			<div class="modal fade" id="modal-container-85878_${n.nid }" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				                    				<div class="modal-dialog">
				                    					<div class="modal-content">
				                    						<div class="modal-header">
				                    							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				                    								×
				                    							</button>
				                    							<h4 class="modal-title" id="myModalLabel">
				                    								警告
				                    							</h4>
				                    						</div>
				                    						<div class="modal-body">
				                    							确认删除？
				                    						</div>
				                    						<div class="modal-footer">
				                    							<button type="button" class="btn btn-default" data-dismiss="modal">
				                    								取消
				                    							</button>
				                    							<button onclick="newsDelete(${n.nid })" type="button" class="btn btn-primary">
				                    								确认
				                    							</button>
				                    						</div>
				                    					</div>
				                    				</div>
				                    			</div>
				    							<!-- <a href="javascript:void(0)" onclick="delete()">删除</a> -->
											</td>
										</tr>
									</c:forEach>
										
									</tbody>
								</table>
							</div>
							<div class="fixed-table-pagination">
								<div class="pull-left pagination-detail"><span class="pagination-info">展现数据 1 to 10 of 13 行</span><span class="page-list"><span class="btn-group dropup"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="page-size">10</span> <span class="caret"></span></button>
									<ul class="dropdown-menu" role="menu">
										<li class="active">
											<a href="javascript:void(0)">10</a>
										</li>
										<li>
											<a href="javascript:void(0)">25</a>
										</li>
										<li>
											<a href="javascript:void(0)">50</a>
										</li>
										<li>
											<a href="javascript:void(0)">100</a>
										</li>
									</ul>
									</span>
									</span>
								</div>
								<div class="pull-right pagination">
									<ul class="pagination">
										<li class="page-first disabled">
											<a href="javascript:void(0)">&lt;&lt;</a>
										</li>
										<li class="page-pre disabled">
											<a href="javascript:void(0)">&lt;</a>
										</li>
										<li class="page-number active disabled">
											<a href="javascript:void(0)">1</a>
										</li>
										<li class="page-number">
											<a href="javascript:void(0)">2</a>
										</li>
										<li class="page-next">
											<a href="javascript:void(0)">&gt;</a>
										</li>
										<li class="page-last">
											<a href="javascript:void(0)">&gt;&gt;</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			</div>
		</div><!--/.row-->	
		
		 <script type="text/javascript">


            //界面跳转方法
            function newsDelete(id) {
              	location.href="newsDel.html?id="+id;
            }
            
            $("button#search").click(function(){
            	var val = $("#searchValue").val();
            	location.href="news.html?search="+val;
            })
            
          </script>
		
</div><!--/.main-->
</body>

</html>
