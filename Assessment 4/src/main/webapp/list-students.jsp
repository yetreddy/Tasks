<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student Tracker App</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
	<body>
		 
		 <div id="header">
		 		<h2>JNTU University</h2>
		 </div>
		
		 
		 <div id="container">
		 	<div id="content">
		 	
		 	<input type="button" value="Add Student" onclick="window.location.href='add-student-form.jsp'; return false;"
		 	class = "add-student-button"/>
		 		<table border = "4" width = "100%">
		 			<tr>
		 			<th>FIrst Name</th>
		 			<th>Last Name</th>
		 			<th> Email</th>
		 			<th>Phone Number</th>
		 			<th>About</th>
		 			<th>PreferredLanguage</th>
		 			<th>Joining Date</th>
		 			<th>Action</th>
		 			</tr>
		 			<c:forEach var="tempStudent" items="${tasksList}">
		 			<%-- <c:url var="templink" value="CreateTaskServlet">
		 				<c:param name="command" value="LOAD"/>
		 				<c:param name="studentId" value="${tempStudent.id }"/>
		 			</c:url>
		 				 --%>
		 			<%-- <c:url var="deletelink" value="StudentControllerServlet">
		 				<c:param name="command" value="DELETE"/>
		 				<c:param name="studentId" value="${tempStudent.id }"/>
		 			
		 			</c:url> --%>
		 			<tr>
		 			<td> ${tempStudent.taskName} </td>
		 			<%-- <td> ${tempStudent.lastName} </td>
		 			<td> ${tempStudent.email}</td>
		 			<td> ${tempStudent.phoneNumber}</td>
		 			<td> ${tempStudent.about}<td>
		 			<td> ${tempStudent.preferredLanguage}<td>
		 			<td> ${tempStudent.joiningDate}</td> --%>
		 			<td> <a href="${templink }">Update</a>
		 			     |
		 			     <a href="${deletelink}" onclick="if(!(confirm('Are you sure you want to delete this student'))) return false">Delete</a>
		 			
		 			</td>
		 			
		 			
		 			</tr>
		 			</c:forEach>
		 		
		 		</table>
		 	
		 	</div>
		 
		 </div>
		
		
	</body>
		
		
		</head>


</html>