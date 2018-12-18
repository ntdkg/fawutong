<%@tag pageEncoding="UTF-8"
display-name="delegateIF"
small-icon="/WEB-INF/small.jpg"
large-icon="/WEB-INF/large.jpg"
description="代理的if判断"
import="java.util.*"
isELIgnored="false"
%>
<%@attribute name="str" type="java.lang.String" required="true" %>
<%@attribute name="var" required="true" rtexprvalue="false"%>
<%@variable name-from-attribute="var" alias="items" variable-class="java.util.List" scope="AT_END" %>
<%
List<String> list = new ArrayList<String>();
if (str.equals("其他")) {
	list.add("selected");
}else{
	list.add("");
}
if(str.equals("家庭婚姻")){
	list.add("selected");
}else{
	list.add("");
}
if(str.equals("财务纠纷")) {
	list.add("selected");
}else{
	list.add("");
}
if(str.equals("劳动纠纷")) {
	list.add("selected");
}else{
	list.add("");
}
if(str.equals("交通事故")) {
	list.add("selected");
}else{
	list.add("");
}
jspContext.setAttribute("items", list);
%>