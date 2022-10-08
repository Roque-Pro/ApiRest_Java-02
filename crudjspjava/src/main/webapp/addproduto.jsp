<%@page import = "com.crudjspjava.crudjspjava.dao.ProdutoDao" %>
<jsp:useBean id = "p" class = "com.crudjspjava.crudjspjava.Produto"></jsp:useBean>
<jsp:setProperty property="*" name ="p"/>


<%


int i = ProdutoDao.salvarProduto(p);

if(i > 0){
	response.sendRedirect("addproduto-success.jsp");
}else{
	response.sendRedirect("addproduto-error.jsp");
}


%>