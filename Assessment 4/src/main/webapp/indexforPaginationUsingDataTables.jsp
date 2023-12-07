<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html> 
<head> 
<!-- jQuery -->
<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"> 
</script> 

<!-- DataTables CSS -->
<link rel="stylesheet"
		href= 
"https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"> 

<!-- DataTables JS -->
<script src= 
"https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"> 
</script> 
</head> 

<body> 
<h1 style="color: green;"> 
	GeeksForGeeks 
</h1> 
<h3>DataTables Paging Option</h3> 

<!-- HTML table with student data -->
<table border = "3" width = "100%" id="alltasksDataTable" class="display">
		 			<thead>
		 			<tr  class="header" role="row">
		 			<th>Task Name</th>
		 			<th>Status</th>
		 			<th> Start Date</th>
		 			<th>End Date</th>
		 			<th>Delete</th>
		 			</tr>
		 			</thead>
		 			<tbody>
		 			 <c:forEach var="tempStudent" items="${tasksList}">
		 			<%-- <c:url var="templink" value="CreateTaskServlet">
		 				<c:param name="command" value="LIST"/>
		 				<c:param name="tasksId" value="${tempStudent.id}"/>
		 			</c:url> --%>
		 			<%--	
		 			<c:url var="deletelink" value="CreateTaskServlet">
		 				<c:param name="command" value="DELETE"/>
		 				<c:param name="tasksId" value="${tempStudent.id }"/>
		 			
		 			</c:url> --%>
		 			
		 			<tr>
		 			<td> <a href="#" id="myBtn" onclick="test1('${tempStudent.parkingReason}','${tempStudent.simLink}','${tempStudent.id}','${tempStudent.startDate}','${tempStudent.endDate}','${tempStudent.status}', '${tempStudent.taskName}');">${tempStudent.taskName}</a></td>
		 			<td> ${tempStudent.status} </td>
		 			<td> ${tempStudent.startDate}</td>
		 			<td> ${tempStudent.endDate}</td>
		 			<td><button type="button" class="btn btn-outline-secondary btn-block" onclick="deletefn('${tempStudent.id}');"><strong>Delete</strong></button></td>
		 			</tr>
		 			
		 			</c:forEach>
		 			</tbody>
		 			
		 	 
</table> 
<script> 

	// Initialize the DataTable 
	$(document).ready(function () { 
	$('#alltasksDataTable').DataTable({ 

		// Disable paging 
		// of the DataTable 
		paging: true 
	}); 
	}); 
</script> 
</body> 
</html>

