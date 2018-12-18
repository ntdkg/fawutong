<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="col-md-4" style="padding-left: 64px;">
			
	<img src="../../img/img_banner_01.png" height="100px" style="margin-bottom: 16px; border-radius: 5px;" />
	
	<h3 style="border-left: solid 4px #FF5555; padding-left: 8px;">
		热门律师
	</h3>
		
	<c:forEach items="${hotLawyers }" var="hotLawyer">
		<div class="media">
			<a class="pull-left" href="./${hotLawyer.uid}.html" target="_blank">
				<img height="76px" width="76px" class="img-circle" src="${pageContext.request.contextPath}/${hotLawyer.limage}" style="border: 1px solid #E0E0E0;" />
			</a>
			<a href="./${hotLawyer.uid}.html" target="_blank">
				<div>
					<h4>${hotLawyer.lname }</h4>
					<p>
						所在地：${fn:substring(hotLawyer.lcity, 0, fn:indexOf(hotLawyer.lcity, "市")+1) }<br/>
						事务所：${hotLawyer.loffice }
					</p>
				</div>
			</a>
		</div>
	</c:forEach>
	
</div>