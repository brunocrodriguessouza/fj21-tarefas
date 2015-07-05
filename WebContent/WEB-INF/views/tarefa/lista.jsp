<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="resources/css/jquery.css" rel="stylesheet">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<title>Lista Tarefas</title>
</head>
<body>
	<script type="text/javascript">
	  function finalizaAgora(id) {
	    $.post("finalizaTarefa", {'id' : id}, function(resposta) {
	      $("#tarefa_"+id).html(resposta);
	    });
	  }
	</script>
	</script>

	<a href="novaTarefa">Criar nova tarefa</a>

	<br />
	<br />

	<table>
		<tr>
			<th>Id</th>
			<th>Descricao</th>
			<th>Finalizado</th>
			<th>Data de finalizacao</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tarefa_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>

				<c:if test="${tarefa.finalizado eq false }">
					<td id="tarefa_${tarefa.id }"><a href="#" onClick="finalizaAgora(${tarefa.id})">Finaliza agora!</td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true }">
					<td>Finalizado</td>
				</c:if>

				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
						pattern="dd/MM/YYYY" /></td>

				<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>