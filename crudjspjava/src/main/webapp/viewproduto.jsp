
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Produtos</title>
</head>
<body>

<%@ page import = "com.crudjspjava.crudjspjava.dao.ProdutoDao, com.crudjspjava.crudjspjava.*, java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<h1> Lista de Produtos </h1>

<%
List<Produto> list = ProdutoDao.getAllProdutos();
request.setAttribute("list", list);
%>

<table border = "1">
<tr>
<th>ID</th>
<th>Nome</th>
<th>Quantidade</th>
<th>Observação</th>
<th>Editar</th>
<th>Excluir</th>

<c:forEach items = "${list}" var = "produto">
<tr>
<td> ${produto.getId() }</td>
<td> ${produto.getNome() }</td>
<td> ${produto.getQuantidade() }</td>
<td> ${produto.getObservacao() }</td>
<td> <a href = "editform.jsp?id=${produto.getId()}">Editar</a>  </td>
<td> <a href = "deleteform.jsp?id=${produto.getId()}">Excluir</a> </td>


</tr>


</c:forEach>

</table>

<br>
<a href="addprodutoform.html">Adcionar novo produto</a>

</body>
</html>