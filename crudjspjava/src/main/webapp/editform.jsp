<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição do produto</title>
</head>
<body>
	<%@ page
		import="com.crudjspjava.crudjspjava.Produto, com.crudjspjava.crudjspjava.dao.ProdutoDao"%>

	<%
	String id = request.getParameter("id");
	Produto produto = ProdutoDao.getRegistroById(Integer.parseInt(id));
	%>


	<h1>Edição do Produto</h1>

	<form action="editproduto.jsp" method="post">
		<input type="hidden" name="id" value="<%=produto.getId()%>" />
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="nome"
					value="<%=produto.getNome()%>" /></td>
			</tr>
			
			<tr>
				<td>Quantidade:</td>
				<td><input type="text" name="quantidade"
					value="<%=produto.getQuantidade()%>" /></td>
			</tr>
			
			<tr>
				<td>Observação:</td>
				<td><input type="text" name="observacao"
					value="<%=produto.getObservacao()%>" /></td>
			</tr>
			
			<tr>
			<td colspan = "1"> <input  type = "submit" value = "Editar Produto" ></input>   </td>
			</tr>
		</table>
	</form>


</body>
</html>