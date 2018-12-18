/**

	demo:
		$("选择器").tip(这里传参数,对象传参);
		$("a:odd").tip({
			y : 30,
			x : 30
			
		});
**/
(function($){
	$.fn.tip = function(options){
		var defaults = {
			x : 15,
			y : 20,
			showTime : 100	
		};	
		var options = $.extend(defaults,options);
		//鼠标移动上去
		$selector = $(this);	//最外面的$(this)当前于选择器
		$selector.mouseover(function(event){
			this.newTitle = this.title;
			this.title = '';
			$('body').append("<div class='tip'>"+this.newTitle+"</div>");
			$(".tip").css({
				left : 	event.pageX + options.x,
				top	 :	event.pageY + options.y
			}).show(options.showTime);
		//鼠标来回移动	
		}).mousemove(function(event){
			$(".tip").css({
				left : 	event.pageX + options.x,
				top	 :	event.pageY + options.y
			})
		//鼠标移走		
		}).mouseout(function(){
			$(".tip").remove();
			this.title = this.newTitle;
		})	
	}	
})(jQuery);