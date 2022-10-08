<%@page import = "com.crudjspjava.crudjspjava.dao.ProdutoDao"%>
<jsp:useBean id = "p" class = "com.crudjspjava.crudjspjava.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
ProdutoDao.deletarProduto(p);
response.sendRedirect("viewproduto.jsp");

%>