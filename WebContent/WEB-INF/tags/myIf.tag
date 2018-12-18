<%@tag pageEncoding="UTF-8"
display-name="myIf"
small-icon="/WEB-INF/small.jpg"
large-icon="/WEB-INF/large.jpg"
description="myif判断"
import="java.util.*"
isELIgnored="false"
%>
<%@attribute name="str" type="java.lang.String" required="true" %>
<%@attribute name="var" required="true" rtexprvalue="false"%>
<%@variable name-from-attribute="var" alias="items" variable-class="java.util.List" scope="AT_END" %>
<%

List<String> list = new ArrayList<String>();
if (str.equals("通过")) {
	list.add("selected");
}else{
	list.add("");
}
if(str.equals("审核中")){
	list.add("selected");
}else{
	list.add("");
}
if(str.equals("未通过")) {
	list.add("selected");
}else{
	list.add("");
}
jspContext.setAttribute("items", list);
%>