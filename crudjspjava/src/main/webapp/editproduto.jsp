<%@page import = "com.crudjspjava.crudjspjava.dao.ProdutoDao" %>
<jsp:useBean id = "p" class = "com.crudjspjava.crudjspjava.Produto"></jsp:useBean>
<jsp:setProperty property="*" name = "p"/>


<% 
int i = ProdutoDao.updateProduto(p);

response.sendRedirect("viewproduto.jsp");

%>