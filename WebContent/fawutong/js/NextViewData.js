UrlParm = function() { // url参数
 var data, index;
 (function init() {
  data = [];
  index = {};
  var u = window.location.search.substr(1);
  if (u != '') {
   var parms = decodeURIComponent(u).split('&');
   for (var i = 0, len = parms.length; i < len; i++) {
    if (parms[i] != '') {
     var p = parms[i].split("=");
     if (p.length == 1 || (p.length == 2 && p[1] == '')) {// p | p=
      data.push(['']);
      index[p[0]] = data.length - 1;
     } else if (typeof(p[0]) == 'undefined' || p[0] == '') { // =c | =
      data[0] = [p[1]];
     } else if (typeof(index[p[0]]) == 'undefined') { // c=aaa
      data.push([p[1]]);
      index[p[0]] = data.length - 1;
     } else {// c=aaa
      data[index[p[0]]].push(p[1]);
     }
    }
   }
  }
 })();
 return {
  // 获得参数,类似request.getParameter()
  parm : function(o) { // o: 参数名或者参数次序
   try {
    return (typeof(o) == 'number' ? data[o][0] : data[index[o]][0]);
   } catch (e) {
   }
  },
  //获得参数组, 类似request.getParameterValues()
  parmValues : function(o) { // o: 参数名或者参数次序
   try {
    return (typeof(o) == 'number' ? data[o] : data[index[o]]);
   } catch (e) {}
  },
  //是否含有parmName参数
  hasParm : function(parmName) {
   return typeof(parmName) == 'string' ? typeof(index[parmName]) != 'undefined' : false;
  },
  // 获得参数Map ,类似request.getParameterMap()
  parmMap : function() {
   var map = {};
   try {
    for (var p in index) { map[p] = data[index[p]]; }
   } catch (e) {}
   return map;
  }
 }
}();



! function() {
	"use strict";
	var t = angular.module("studentApp", ["ui.router", "ngResource"]);
	t.config(["$stateProvider", "$urlRouterProvider", function(t, e) {
		t.state("students", {
			url: "/students",
			templateUrl: "./templates/list.html",
			controller: "ListCtrl",
			resolve: {
				students: ["StudentService", function(t) {
					return t.query()
				}]
			}
		}).state("students.edit", {
			url: "/edit/:id",
			templateUrl: "./templates/edit.html",
			controller: "EditCtrl"
		}).state("students.add", {
			url: "/add",
			templateUrl: "./templates/add.html",
			controller: "AddCtrl"
		}), e.otherwise("/students")
	}]), t.config(["$httpProvider", function(t) {
		t.defaults.headers.post["Content-Type"] = "application/json;charset=UTF-8", t.defaults.headers.put["Content-Type"] = "application/json;charset=UTF-8"
	}])
}(),
function() {
	"use strict";
	toastr.options.timeOut = 3e3, toastr.options.positionClass = "toast-top-right"
}(),
function() {
	"use strict";
	var t = angular.module("studentApp");
	t.controller("WrapperCtrl", ["$scope", "StudentService", function(t, e) {
		e.query(function(e) {
			0 === e.ret && (console.log(e), t.students = e.students)
		}, function() {})
	}]), t.controller("ListCtrl", ["$scope", "$state", "students", "StudentService", function(t, e, n, s) {
		t.fname = "", t.predicate = "name", t.addStudent = function() {
			e.go("add")
		}, t.delStudent = function(e) {
			s.remove({}, e, function() {
				t.students.forEach(function(n, s) {
					n.id == e.id && t.students.splice(s, 1)
				})
			}, function(t) {
				toastr.error(t)
			})
		}
	}]), t.controller("EditCtrl", ["$scope", "$state", "$stateParams", "StudentService", function(t, e, n, s) {
		var o = n.id,
			r = 0;
		o ? t.students.forEach(function(e, n) {
			e.id == o && (r = n, t.student = angular.copy(e))
		}) : e.go("students"), t.save = function() {
			var n = t.student;
			s.update({}, n, function(s) {
				console.log(s), 0 === s.ret ? (toastr.success("更新成功"), t.students.splice(r, 1, n), e.go("students")) : toastr.error("更新失败，原因为：" + s.msg)
			}, function(t) {
				console.log(t)
			})
		}, t.cancel = function() {
			e.go("students")
		}
	}]), t.controller("AddCtrl", ["$scope", "$state", "StudentService", function(t, e, n) {
		t.student = {}, t.add = function() {
			var s = t.student;
			n.add({}, s, function(n) {
				0 == n.ret ? (s = n.student, console.log(n), t.students.splice(0, 0, s), toastr.success("学生添加成功"), t.student = {}, e.go("students")) : toastr.error("学生添加失败,原因为: " + n.msg)
			}, function(t) {
				toastr.error(t)
			})
		}, t.cancel = function() {
			e.go("students")
		}
	}])
}(),
function() {
	"use strict";
	var t = angular.module("studentApp");
	t.filter("sex", function() {
		return function(t) {
			return t ? "1" == t ? "男" : "0" == t ? "女" : "未知" : "未知"
		}
	})
}(),

function() {
	"use strict";
	var t = angular.module("studentApp");
	t.factory("StudentService", ["$resource", "$q", function(t) {
		var e = t("http://172.17.3.2:8080/student/:id", {
			id: "@id"
		}, {
			query: {
				method: "GET",
				isArray: !1
			},
			get: {
				method: "GET",
				isArray: !1
			},
			add: {
				method: "POST",
				isArray: !1
			},
			update: {
				method: "PUT"
			},
			remove: {
				method: "DELETE"
			}
		});
		return e
	}])
}();