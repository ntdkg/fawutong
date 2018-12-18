<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>最新资讯</title>

	<link rel="stylesheet" href="../css/common.css" type="text/css">
	
	<style type="text/css">
		<style type="text/css">
		.hide {
			display: none;
		}
		
		.top {
			width: 100%;
			height: 41px;
			position: fixed;
			top: 0px;
			z-index: 99;
			box-shadow: 0 1px 0 rgba(0, 0, 0, 0.2);
		}
		
		.header {
			margin-top: -20px;
			width: 960px;
			height: 200px;
			margin: 0px auto;
			background: rgba(255, 255, 255, .1);
		}
		
		.container {
			width: 960px;
			margin: 0px auto;
			position: relative;
		}
		
		.scrubber {
			width: 47px;
			min-height: 200px;
			position: absolute;
			top: 29px;
			left: 0px;
			z-index: 999;
		}
		
		.scrubber a {
			display: block;
			height: 26px;
			line-height: 26px;
			font-size: 12px;
			border-right: 2px solid #c8c8c8;
			border-right-color: rgba(200, 200, 200, 0.5);
			padding-right: 5px;
			color: #a5a5a5;
			text-decoration: none;
			text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);
			text-align: right;
		}
		
		.scrubber a:hover,
		.scrubber a.current {
			border-right-color: #7ebad0;
			color: #7ebad0;
			font-weight: bold;
		}
		
		.scrubber a:hover {
			text-decoration: underline;
		}
		
		.scrubber a.current:hover {
			text-decoration: none;
		}
		
		.content {
			min-height: 1000px;
			background: url(img/spine.png) repeat-y 121px 0;
			padding-top: 50px;
			padding-left: 160px;
			position: relative;
		}
		
		.content_year {
			height: 30px;
			line-height: 30px;
			color: #a5a5a5;
			text-shadow: 0px 1px 1px rgba(0, 0, 0, .3);
			font-weight: bold;
			font-size: 14px;
			position: relative;
			left: -90px;
			clear: both;
		}
		
		.content_month {
			height: 30px;
			line-height: 30px;
			color: #a5a5a5;
			text-shadow: 0px 1px 1px rgba(0, 0, 0, .3);
			font-weight: bold;
			font-size: 14px;
			position: relative;
			left: -90px;
			clear: both;
		}
		
		.content_item {
			width: 370px;
			min-height: 300px;
			background: #fff;
			border-radius: 4px;
			margin: 20px 30px 0 0;
			position: relative;
			color: #888;
		}
		
		.content_item_Monthfirst {
			/*每个月第一个*/
			margin-top: -20px;
		}
		
		.content_item_left {
			float: left;
		}
		
		.content_item_right {
			float: right;
		}
		
		.content_item_icon_arrow {
			position: absolute;
			left: -10px;
			top: 20px;
			height: 0px;
			border-color: transparent #fff transparent transparent;
			/*只有右边有颜色 显示三角形*/
			border-width: 10px 10px 10px 0px;
			border-style: dashed solid dashed dashed;
			/*只有右边是实线，其余全是虚线*/
		}
		
		.content_item_icon_dot {
			width: 11px;
			height: 11px;
			border-radius: 11px;
			background: #fff;
			position: absolute;
			left: -43px;
			top: 25px;
		}
		
		.content_item_right .content_item_icon_dot {
			display: none;
		}
		
		.content_item_icon_dot_choose {
			width: 7px;
			height: 7px;
			border-radius: 7px;
			background: #b3dae9;
			position: absolute;
			left: 2px;
			top: 2px;
		}
		
		.content_item_head {
			padding: 15px;
			padding-bottom: 0px;
		}
		
		.content_item_head_title {
			height: 46px;
			line-height: 46px;
			font-size: 28px;
			padding: 0px 0px 10px 56px;
			position: relative;
		}
		
		.content_item_head_title_lunar {
			width: 46px;
			height: 46px;
			background: #B3DAE9;
			border-radius: 8px;
			position: absolute;
			left: 0px;
			top: 0px;
			overflow: hidden;
			color: #FFFFFF;
			font-size: 27px;
			line-height: 23px;
		}
		
		.content_item_head_info {
			font-size: 14px;
			line-height: 22px;
			padding: 0px 15px;
			margin-bottom: 10px;
		}
		
		.content_item_media {
			height: 277px;
			overflow: hidden;
			padding-bottom: 10px;
		}
		
		.content_item_footer {
			padding: 10px 15px;
			margin: 0px 15px;
			border-top: 1px solid #d6d6d6;
			font-size: 12px;
			color: #b2b2b2;
			line-height: 20px;
		}
		
		.content_item_head_info {}
		
		.content_item_footer_like {
			padding-top: 5px;
		}
		
		.content_item_footer_info a {
			color: #2b2b2b;
			text-decoration: none;
			padding-right: 10px;
			display: inline-block;
			height: 20px;
		}
		
		.icon_zan,
		.icon_pin {
			width: 20px;
			height: 20px;
			display: inline-block;
			/*行内显示并转换块*/
			background-repeat: no-repeat;
			/*背景图片不重复*/
			font-size: 0px;
			overflow: hidden;
			background: url(../img/zzhImage/timeline.png);
			vertical-align: bottom;
			/*图标对其方式*/
		}
		
		.icon_zan {
			background-position: -883px -21px;
		}
		
		.icon_pin {
			background-position: -905px -21px;
		}
		
		.ui_icon {
			width: 15px;
			height: 15px;
			display: inline-block;
			/*行内显示并转换块*/
			background-repeat: no-repeat;
			/*背景图片不重复*/
			font-size: 0px;
			overflow: hidden;
			background: url(../img/zzhImage/timeline.png);
			margin-right: 5px;
			vertical-align: bottom;
			/*图标对其方式*/
		}
		
		.quote_before {
			background-position: -986px -85px;
		}
		
		.quote_after {
			background-position: -986px -102px;
		}
	</style>
		</style>
	<script type="text/javascript">
	function showSubMenu(li){
		var subMenu = li.getElementsByTagName('ul')[0];
		subMenu.style.display = 'block';
	}

	function hideSubMenu(li){
		var subMenu = li.getElementsByTagName('ul')[0];
		subMenu.style.display = 'none';
	}
   </script>
</head>
<body style="background: url(../img/bg02.jpg) #1c0c0f center 0 no-repeat fixed;
			margin: 0px;
			padding: 0px;
			padding-top: 0px;
			border-radius: 10px;
			blur(10px);">
	
	<jsp:include page="nomal_nav.jsp"/>
	
	<div class="header">
		<h1 style="color: #FFF; text-shadow: black 0 0 5px; text-align: center; padding: 80px;-webkit-filter:">最 新 资 讯</h1>
	</div>
	<div class="container">
		<div class="scrubber" id="scrubber">
			<div id="tpl_scrubber_year">
				<a href="javascript:;" class="scrubber_year" id="scrubber_year_{{year}}" onclick="show_year({{year}})">{{year}}</a>{list}
			</div>
			<div id="tpl_scrubber_month">
				<a href="javascript:;" class="scrubber_month scrubber_month_in_{{year}}" id="scrubber_month_{{year}}_{{month}}" onclick="show_month({{year}},{{month}})">{{month}}月</a>
			</div>
		</div>
		<div class="content" id="content">
			<div id="tpl_content_year">
				<div class="content_year" id="content_year_{{year}}">{{year}}</div>
				{{list}}
			</div>
			<div id="tpl_content_month">
				<div class="content_month" id="content_month_{{year}}_{{month}}">{{month}}月</div>
				{{list}}
			</div>
			<div id="tpl_content_item">
				<div class="content_item content_item_{{position}} content_item_{{isFirst}}" >
					<div class="content_item_icon_arrow"></div>
					<div class="content_item_icon_dot">
						<div class="content_item_icon_dot_choose"></div>
					</div>
					<div class="content_item_head">
						<div class="content_item_head_title">
							<div class="content_item_head_title_lunar">
								{lunar}
							</div>
							{{date}}
						</div>
						<div class="content_item_head_info">
							公告详情 :
						</div>
						<div class="content_item_head_info">
							
							<i class="ui_icon quote_before"></i> {{info}}
							<i class="ui_icon quote_after"></i>
						</div>
					</div>
					<div class="content_item_media">
						{{media}}
					</div>
					<div class="content_item_footer">
						
						<div style="float: left;" class="content_item_footer_like">
							浏览记录 ：{{like_format}}
						</div>
						<div style="float: right;" class="content_item_footer_like">
							<a href="javascript:;" style="color: #b2b2b2; font-family: '微软雅黑','arial rounded mt bold','楷体'; text-decoration: none;" onclick="changeView({{event_id}})">查看更多信息</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
   	<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="../js/fx.js"></script>
	<script type="text/javascript" src="../js/GetLunarDay.js"></script>
	<script type="text/javascript">
	
		var data = [];
	
		window.onload = function() {
			$.get( "http://120.24.157.27:8080/fawutongWeb/fawutongJson/getInfomations.json", function(result, textStatus, jqXHR){
			    // data 是该请求返回的数据(可能经过处理)
			    // textStatus 可能是"success"、 "notmodified"等
			    // jqXHR 是经过jQuery封装的XMLHttpRequest对象(保留其本身的所有属性和方法)
			    data = result['data'];
			    start();
			});		
			//show_year(2016);
		}
	
		//通用函数
		var g = function(id) {
			if (id.substr(0, 1) == '.') {
				return document.getElementsByClassName(id.substr(1));
			}
			return document.getElementById(id);
		}
		var g_tpl = function(id) {
				return g('tpl_' + id).innerHTML;
			}
			//获得页面宽度
		var get_body_width = function() {
			return document.body.offsetWidth;
		}
		var get_body_height = function() {
			return document.body.offsetHeight;
		}
		
		function start() {
			//格式化数据（json数据类型）
			var list = {};
				
			for (var i = data.length - 1; i >= 0; i--) {
				var date = new Date(data[i].ndate);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var lunar = GetLunarDateString(date);
				if (!list[year]) {
					list[year] = {};
				}
				if (!list[year][month]) {
					list[year][month] = [];
				}
				var item = data[i];
				item.lunar = lunar[0] + '<br/>&nbsp;&nbsp;&nbsp;' + lunar[1];
				item.year = year;
				item.month = month;
				list[year][month].unshift(item);
				item.like_format = item.like < 10000 ? item.like : (item.like / 10000).toFixed(1) + '万'; //点赞人数
			}
			
			//时序菜单 HTML 生成
			var html_scrubber_list = [];
			var tpl_scrubber_year = g_tpl('scrubber_year');
			var tpl_scrubber_month = g_tpl('scrubber_month');
			for (y in list) {
				//临时数据
				var _html_year = tpl_scrubber_year.replace(/{{year}}/g, y);
				var _html_month = [];
				for (m in list[y]) {
					//每一次加载最前面
					_html_month.unshift(tpl_scrubber_month.replace(/{{month}}/g, m).replace(/{{year}}/g, y));
				}
				_html_year = _html_year.replace(/\{list\}/g, _html_month.join(''));
				html_scrubber_list.unshift(_html_year);
			}
			g('scrubber').innerHTML = '<a href="javascript:;" onclick="scroll_Top(0)">最近</a>' + html_scrubber_list.join('') + '<a href="javascript:;" onclick="scroll_Top(get_body_height())">底部</a>';
			//日志列表的HTML生成
			{
				var html_content_list = [];
				var tpl_content_year = g_tpl('content_year');
				var tpl_content_month = g_tpl('content_month');
				var tpl_content_item = g_tpl('content_item');
				for (y in list) {
					//临时数据
					var _html_year = tpl_content_year.replace(/{{year}}/g, y);
					var _html_month = [];
					for (m in list[y]) {
						//每个月里面都有item
						var html_item = [];
						var isFirst_at_month = false;
						var isFirst_finish = false;
						
						for (i in list[y][m]) {
							if (i == 0) {
								isFirst_at_month = true;
							}
							var item_data = list[y][m][i];
							var item_html = tpl_content_item
								.replace(/\{lunar\}/g, item_data.lunar)
								.replace(/{{date}}/g, item_data.ndate)
								.replace(/{{info}}/g, item_data.ntitle)
								.replace(/{{media}}/g, '<img src="http://120.24.157.27:8080/fawutongWeb/'+item_data.nimg+'" width="370" >')
								.replace(/{{like}}/g, '1.0')
								.replace(/{{like_format}}/g, item_data.like_format)
								.replace(/{{position}}/g, i % 2 ? 'right' : 'left') //1是true，跟C语言一样
								.replace(/{{isFirst}}/g, isFirst_at_month ? 'Monthfirst' : ' ')
								.replace(/{{comment}}/g, item_data.comment)
								.replace(/{{event_id}}/g, item_data.nid);
							html_item.push(item_html);
							isFirst_at_month = false;
						}
						//每一次加载最前面
						_html_month.unshift(tpl_content_month.replace(/{{month}}/g, m).replace(/{{list}}/g, html_item.join('')).replace(/{{year}}/g, y));
					}
					_html_year = _html_year.replace(/{{list}}/g, _html_month.join(''));
					html_content_list.unshift(_html_year);
				}
				g('content').innerHTML = html_content_list.join('') + '<div class="content_year" id="content_month_0_0">底部</div>' /*增加出生，加长竖直长条*/ ;
			}
		}
		//获得元素高度
		var get_Height = function(sender) {
				return sender.offsetTop + 170; //offsetTop元素距离content盒子的高度
			}
			//滚动
		var scroll_Top = function(sender) {
				var start = document.body.scrollTop;
				fx(function(now) {
					window.scroll(0, now);
				}, start, sender)
			}
			//年份，月份点击处理
		var show_year = function(year) {
			//后台显示
			console.log(year);
			var to_year = g('content_year_' + year);
			var top = get_Height(to_year);
			//显示Title，不自己滑动
			//scroll_Top(top);
			expand_year(year, g('scrubber_year_' + year));
		}
		var show_month = function(year, month) {
				console.log(year, month);
				var to_month = g('content_month_' + year + '_' + month);
				var top = get_Height(to_month);
				scroll_Top(top);
				highlight_month(g('scrubber_month_' + year + '_' + month));
			}
			//高亮处理-月份
		function highlight_month(senderClass) {
			var months = g('.scrubber_month');
			for (var i = months.length - 1; i >= 0; i--) {
				months[i].className = months[i].className.replace(' current', '');
			}
			senderClass.className = senderClass.className + '  current';
		}
		//年份的店家展开
		function expand_year(year, sender) {
			var months = g('.scrubber_month');
			var show_month = g('.scrubber_month_in_' + year);
			var years = g('.scrubber_year');
			for (var i = months.length - 1; i >= 0; i--) {
				months[i].style.display = 'none';
			}
			for (var i = show_month.length - 1; i >= 0; i--) {
				show_month[i].style.display = 'block';
			}
			for (var i = years.length - 1; i >= 0; i--) {
				years[i].className = years[i].className.replace(' current', '');
			}
			sender.className = sender.className + ' current';
		}
		//更新年份在滑动时
		function update_scrubber_year(top) {
			var content_years = g('content').getElementsByClassName('content_year');
			var tops = [];
			for (var i = 0; i < content_years.length; i++) {
				tops.push(content_years[i].offsetTop);
			}
			for (var i = 0; i < tops.length; i++) {
				if (top > tops[i - 1] && top < tops[i]) {
					var year = content_years[i - 1].innerHTML;
					var s_year = g('scrubber_year_' + year);
					expand_year(year, s_year);
				}
			}
		}

		function update_scrubber_month(top) {
			//首先获得列表中月份标签
			var content_months = g('content').getElementsByClassName('content_month');
			var tops = [];
			for (var i = 0; i < content_months.length; i++) {
				tops.push(content_months[i].offsetTop);
			}
			//定位 top 在窗口哪个月份的区间
			for (var i = 0; i < tops.length; i++) {
				if (top > tops[i - 1] && top < tops[i]) {
					var id = content_months[i - 1].id;
					highlight_month(g(id.replace('content', 'scrubber')));
				} else if (top > tops[i]) {
					//最后一个会超出最大距离，所以必须单独写
					var id = content_months[i].id;
					highlight_month(g(id.replace('content', 'scrubber')));
				}
			}
		}
		
		//界面跳转方法
		function changeView(user_id) {
			window.location.href = 'detail.html?nid='+user_id;
		}
		
		//页面滚动处理，固定时序菜单的位子。自动展开时序菜单
		window.onscroll = function() {
			var top = document.body.scrollTop;
			var scrubber = g('scrubber');
			if (top > 200) {
				scrubber.style.position = 'fixed';
				scrubber.style.top = '60px';
				scrubber.style.left = (get_body_width() - 960) / 2 + 'px';
			} else {
				scrubber.style.position = '';
				scrubber.style.top = '';
				scrubber.style.left = '';
			}
			update_scrubber_year(top);
			update_scrubber_month(top);
		}
	</script>
	
	<jsp:include page="./user/footer.jsp"/>
	
</body>
</html>