<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Manager</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
    .required::after{
         content:"*";
         color: red;
    }
    .error{
    border : 1px solid red;
    }
    .errorMessage{
    	color:red;
    }
    </style>
</head>
<body>

<!-- Page Wrapper -->
<div class="container mt-3">

    <!-- Tabs -->
    <ul class="nav nav-tabs" id="taskTabs">
    
        <li class="nav-item">
            <a class="nav-link active" id="allTasksTab" data-toggle="tab" href="#allTasks">All Tasks</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="completedTasksTab" data-toggle="tab" href="#completedTasks">Completed Tasks</a>
        </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content mt-2">
        <!-- All Tasks Tab -->
        <div class="tab-pane fade show active" id="allTasks">
            <div class="row">
                <!-- Left Side Content -->
                <div class="col-md-6">
                    <h2> Task Management</h2>
                   <!--  <a>Show</a>
                    <select name="taskList">
    <option value="category_id">10</option>
    <option value="category_id">20</option>
    <option value="category_id">30</option>

</select>
<a>entries</a> -->
                </div>
                
                <!-- Right Side Modal Dialogue Trigger -->
                <div class="col-md-6">
                    <button class="btn btn-link float-right" data-toggle="modal" data-target="#addTaskModal">Add New Task</button>
                </div>
            </div>
            <div class="container mt-3">
 <div id="container"> 
		 	<div id="content">
		 	<!-- <input type="text" id="myInput" onkeyup="searchTable()" placeholder="Search for names.."> -->
		 	<div class="form-group col-md-2 float-right" >
		 	<!-- <label for="statusFilterDropDown">Status:</label> -->
		 	<!-- <input type="text" id="allTaskSeach" onkeyup="searchTable('alltasksDataTable','allTaskSeach')" placeholder="Search"> -->
        <select class="form-control" id="statusFilterDropDown" name="statusFilterDropDown" onchange="searchTable('alltasksDataTable','allTaskSeach')">
        <option value="">Status</option>
        <option value="pending">Pending</option>
        <option value="WIP">Work in Progress</option>
        </select>
        </div>
		 		<table border = "3" width = "100%" id="alltasksDataTable">
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
		 		
		 	</div>
		 
		 </div>
		
		 </div>

        </div>

        <!-- Completed Tasks Tab -->
        <div class="tab-pane fade" id="completedTasks">
        
            <h2>Completed Tasks</h2>
            <!-- <input type="text" id="completedTaskSearch" onkeyup="searchCompletedTable('completedTaskDataTable','completedTaskSearch')" placeholder="Search"> -->
            <form id="completedTaskForm">
            <!-- <form id="completedTaskListForm" action="CreateTaskServlet" method="get">
            <input type="hidden" name="command" value="COMPLETE_TASKS"/> -->
            <table border = "4" width = "100%" id="completedTaskDataTable">
            <thead>
            <tr>
            	<!-- <th>id</th> -->
            	<th>Task Name</th>
            	<th>Status</th>
            	<th>Start Date</th>
            	<th>End Date</th>
            	
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tempStudent1" items="${tasksList1}">
            
		 			<tr>
		 			<%-- <td>"${tempStudent1.id }"</td> --%>
		 			<td id="completedTaskName"> <a href="#" id="completeTaskDialog" onclick="test('${tempStudent1.parkingReason}','${tempStudent1.simLink}','${tempStudent1.startDate}','${tempStudent1.endDate}', '${tempStudent1.taskName}', '${tempStudent1.status}');">${tempStudent1.taskName}</a></td>
		 			<%-- <td id="myBtn1">${tempStudent.taskName}</td> --%>
		 			<td> ${tempStudent1.status} </td>
		 			<td> ${tempStudent1.startDate}</td>
		 			<td> ${tempStudent1.endDate}</td>
		 			<%-- <td > ${tempStudent1.parkingReason}</td> --%>

		 			</tr>
		 			
		 			</c:forEach>
		 			</tbody>
		 			</table>
            </form>
           
        </div>
    </div>
    
</div>



<!-- Add Task Modal -->
<div class="modal" id="addTaskModal">
    <div class="modal-dialog modal-dialog-right">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"> New Task</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal Body -->
            <form id="addTaskForm" action="CreateTaskServlet" method="get">
            <input type="hidden" name="command" value="CREATE"/>
            <div class="modal-body">
                <!-- Form for adding tasks !-->                    
                    <div class="form-group">
                        <label class ="required" for="taskName">Task Name</label>
                        <input type="text" class="form-control" id="taskName" name="taskName" >
                        <label id="tname" style="color : red; visibility: hidden;">Please enter task name</label>
                    </div>
                    <div class="form-group">
                        <label for="SIM Link">SIM Link</label>
                        <input class="form-control" id="SIMLink" name="SIMLink" rows="3"></input>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="required" for="startDate">Start Date</label>
                            <input type="date" class="form-control " id="startDate" name="startDate" required>
                            <label id="sdate" style="color : red; visibility: hidden;">Please select start date</label>    
                        </div>
                        <div class="form-group col-md-6">
                            <label for="endDate">End Date</label>
                            <input type="date" class="form-control " id="endDate" name="endDate" required>
                        </div>  
                    </div>
                    <!-- Save Button -->
                    <button type="button" class="btn btn-primary float-right" id="saveTaskBtn">Create New Task</button>
            </div>
            </form>
            
        </div>
    </div>
</div>


 <div class="modal fade" id="completedTask" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <h4 id="dynamicCompletedTask" class="modal-title">Update</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <!-- <h4 id="dynamicCompletedTask" class="modal-title">Modal Header</h4> -->
        </div>
        <form>
        <div class="modal-body">
        <div class="form-group">
        <label for="completedTaskStatus">Status:</label>
        <select class="form-control" id="completedTaskStatus" name="completedTaskStatus" disabled>
        <option value="pending">Pending</option>
        <option selected value="completed">Completed</option>
        <option value="WIP">Work in Progress</option>
        <option value="parked">Parked</option>
        </select>
        </div>
                        <div class="form-group" id="completedParkingReasonDiv" style="display: none;">
                            <label for="completedParkingReason">Reason for Parking:</label>
                            <textarea class="form-control" id="completedParkingReason" name="completedParkingReason" rows="3" readonly></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="simpleLink">Simple Link:</label>
                            <input type="text" class="form-control" id="SIMLink" name="SIMLink" readonly>
                        </div>
                        <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="startDate">Start Date:</label>
                            <input type="date" class="form-control " id="startDate" name="startDate" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="endDate">End Date:</label>
                            <input type="date" class="form-control " id="endDate" name="endDate" readonly>
                        </div>
                        </div>
                        
                        </div>
                        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>   
    </div>
    
     <div class="modal fade" id="deleteTask" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Confirm Deletion</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- <form> -->
        <form id="deleteTaskForm" action="CreateTaskServlet" method="get">
            <input type="hidden" name="command" value="DELETE"/>
        <div class="modal-body">
                        <div class="form-group" id="deleteJustificationDiv"">
                            <label for="deleteJustification">Justification:</label>
                            <textarea class="form-control" id="deleteJustification" name="deleteJustification" rows="3"></textarea>
                        </div>
                         <div class="form-group" id="tasksIdFormGroup">
                            <input type="hidden" class="form-control" id="tasksIdForDelete" name="tasksId">
                        </div>
                        <!-- <div class="form-group">
                            <label for="startDate">Start Date:</label>
                            <input type="date" class="form-control " id="startDate" name="startDate" required>
                        </div>
                        <div class="form-group">
                            <label for="endDate">End Date:</label>
                            <input type="date" class="form-control " id="endDate" name="endDate" required>
                        </div> --> 
                        <button type="button" class="btn btn-primary float-right" id="deleteBtn">Delete Task</button>
                        </div>
                        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>   
    </div>
  <%-- <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-dialog-right">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Update Task</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
 			<form id="updateTaskForm" action="CreateTaskServlet" method="get">
            <input type="hidden" name="command" value="UPDATE"/>
                <!-- Modal Body -->
                <div class="modal-body">
                    <!-- Form for updating tasks -->    
                    <c:forEach var="tempStudent" items="${tasksList}">
                    <input type="hidden" name="tasksId" value="${tempStudent.id}" />
                    </c:forEach>                
                       <div class="form-group">
                            <label for="taskStatus1">Status:</label>
                            <select class="form-control" id="taskStatus1" name="taskStatus1">
                                <option value="pending">Pending</option>
                                <option value="completed">Completed</option>
                                <option value="WIP">Work in Progress</option>
                                <option value="parked">Parked</option>
                            </select>
                        </div>
                        <div class="form-group" id="parkedReasonDiv1" style="display: none;">
                            <label for="parkedReason">Reason for Parking:</label>
                            <textarea class="form-control" id="parkedReason" name="parkedReason" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="simpleLink">Simple Link:</label>
                            <input type="text" class="form-control" id="SIMLink" name="SIMLink">
                        </div>
                        <div class="form-group">
                            <label for="startDate">Start Date:</label>
                            <input type="date" class="form-control " id="startDate" name="startDate" required>
                        </div>
                        <div class="form-group">
                            <label for="endDate">End Date:</label>
                            <input type="date" class="form-control " id="endDate" name="endDate" required>
                        </div>
                        </div>
                        <!-- Update Button -->
                        <button type="button" class="btn btn-primary float-right" id="performUpdateBtn" onclick=>Update Details</button>
                        <a class="btn btn-primary float-right" id="performUpdateBtn" href="${templink }">Update Details</a>
                    </form>
                </div>
            </div>
            </div> --%>
<div class="modal" id="updateTaskModal">
        <div class="modal-dialog modal-dialog-right">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 id="dynamicTaskName" class="modal-title">Update</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
            <form id="updateTaskForm" action="CreateTaskServlet" method="get">
            <input type="hidden" name="command" value="UPDATE"/>
                <!-- Modal Body -->
                <div class="modal-body">
                    <!-- Form for updating tasks -->
                   <%-- <c:forEach var="tempStudent" items="${tasksList}">
                    <input type="hidden" name="tasksId" value="${tempStudent.id}" />
                    </c:forEach> --%> 
                    <input type="hidden" name="tasksId" id= "tasksIdForUpdate" />
                        <div class="form-group">
                            <label for="taskStatus">Status:</label>
                            <select class="form-control" id="taskStatus" name="taskStatus">
                                <option value="pending">Pending</option>
                                <option value="completed">Completed</option>
                                <option value="WIP">Work in Progress</option>
                                <option value="parked">Parked</option>
                            </select>
                        </div>
                        <div class="form-group" id="parkedReasonDiv" style="display: none;">
                            <label for="parkingReason">Reason for Parking:</label>
                            <textarea class="form-control" id="parkingReason" name="parkingReason" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="simpleLink">Simple Link:</label>
                            <input type="text" class="form-control" id="SIMLink" name="SIMLink">
                        </div>
                        <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="startDate">Start Date:</label>
                            <input type="date" class="form-control " id="startDate" name="startDate" required>
                        </div>
                        <div class="form-group  col-md-6">
                            <label for="endDate">End Date:</label>
                            <input type="date" class="form-control " id="endDate" name="endDate" required>
                        </div>
                        </div>
                        <!-- Update Button -->
                        <button type="button" class="btn btn-primary float-right" id="performUpdateBtn">Update Details</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
<!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
<!-- jQuery -->
<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"> 
</script> 
<!--  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<!-- DataTables CSS -->
<link rel="stylesheet"
		href= 
"https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"> 

<!-- DataTables JS -->
<script src= 
"https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"> </script>
<script>
$(document).ready(function () { 
	$('#alltasksDataTable').DataTable({ 

		// Disable paging 
		// of the DataTable 
		/* paging: true */
	}); 
	});
$(document).ready(function () { 
	$('#completedTaskDataTable').DataTable({ 

		// Disable paging 
		// of the DataTable 
		/* paging: true, */
		
	}); 
	});
/* $(document).ready(function () {
    var table = $('#alltasksDataTable').DataTable();
 }); */
	//Initialize datepickers
	 $('.datepicker').datepicker({
	    format: 'yyyy-mm-dd',
	    autoclose: true,
	    todayHighlight: true
	}); 
	 /* $('.document').ready(function(){
		  $("#myBtn").click(function(){
		    $("#myModal").modal();
		    
		  });
		}); */ 
	 $('.document').ready(function(){
		  $("#myBtn").click(function(){
		    $("#updateTaskModal").modal();
		    
		  });
		}); 
	 
		  $("#completeTaskDialog").click(function(){
			  <%-- var jsAtt = '<%= request.getAttribute("tasksList1") %>';
			  var completedTaskForm = document.getElementById("completedTaskForm").value; 
			  console.log(completedTaskForm);
			     $(".modal-body #parkedReason").val( parkedReason );
 --%> /* $(".modal-body #parkedReason").val( parkingReason );
		    $("#completedTask").modal(); */
		    
		    
		  }); 
	$("#myBtn2").click(function(){
		$("#deleteTask").modal();
	}); 
    // Save Task Button Click Event
    $('#saveTaskBtn').click(function () {
        // Get task details from the form
        var taskName = $('#taskName').val();
        var taskDescription = $('#taskDescription').val();
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val(); 
        var isValid = validate('taskName', 'startDate', "tname", "startDate")
       /*  var isValid = tnameValidate('taskName',"tname"); */ 
        // Add your logic here to save the task details or perform any other actions
        /* var tasks = $('#tasksList').val(); */
        
       /*  console.log(tasks) */
        if(isValid) {
        	var form = document.getElementById("addTaskForm");
            form.submit();
         // Close the modal
            $('#addTaskModal').modal('hide');
            // Clear the form
            $('#taskName, #taskDescription, #startDate, #endDate').val('');
        }	
    });
	 $('#performUpdateBtn').click(function () {
        // Get task details from the form
        /* var id = ${tempStudent.id }; */
        /* var simLink = $('#SIMLink').val(); */
        var taskDescription = $('#taskDescription').val();
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val(); 
		var taskId = $('#tasksId').val();
        var isValid = tnameValidate('taskName',"tname"); 
        var SIMLink = $('#SIMLink').val();
        var taskStatus1 = $('#taskStatus1').val();
        var parkingReason = $('#parkingReason').val();
        // Add your logic here to save the task details or perform any other actions
        /* var tasks = $('#tasksList').val();
    
        console.log(tasks) */
        console.log(taskId)
        var form = document.getElementById("updateTaskForm");
        form.submit();
        $('#updateTaskModal').modal('hide');
        // Clear the form
        $('#taskName, #taskDescription, #startDate, #endDate, #SIMLink, #tasksId,#deleteJustification, #parkingReason').val('');
        if(isValid) {
        	 var form = document.getElementById("updateTaskForm1");
            form.submit();
         // Close the modal
            $('#updateTaskModal').modal('hide');
            // Clear the form
            $('#taskName, #taskDescription, #startDate, #endDate, #SIMLink, #tasksId, ').val('');
        }	
    });
	 
	 $('#deleteBtn').click(function () {
	        // Get task details from the form
	        /* var id = ${tempStudent.id }; */
	        /* var simLink = $('#SIMLink').val(); */
	        var taskDescription = $('#taskDescription').val();
	        var startDate = $('#startDate').val();
	        var endDate = $('#endDate').val(); 
			var id = $('#tasksIdForDelete').val();
	        var isValid = tnameValidate('taskName',"tname"); 
	        var tasksId = $('#tasksIdForDelete').val();
	        // Add your logic here to save the task details or perform any other actions
	        /* var tasks = $('#tasksList').val();
	    
	        console.log(tasks) */
	        /* console.log(taskId) */
	        var form = document.getElementById("deleteTaskForm");
	        form.submit();
	        window.history.pushState('','','/index.jsp')
	        $('#deleteTask').modal('hide');
	        $('#taskName, #taskDescription, #startDate, #endDate, #SIMLink, #tasksId,#deleteJustification, #parkingReason').val('');
	        
	        /* if(isValid) {
	            var form = document.getElementById("updateTaskForm");
	            form.submit();
	         // Close the modal
	            $('#addTaskModal').modal('hide');
	            // Clear the form
	            $('#taskName, #taskDescription, #startDate, #endDate').val('');
	            
	        } */	
	    });
	// Show/hide the parked reason textarea based on selected status
	    $('#taskStatus').change(function () {
	    	console.log("inside parkingdiv")
	        var selectedStatus = $(this).val();
	        if (selectedStatus === 'parked') {
	            $('#parkedReasonDiv').show();
	        } else {
	            $('#parkedReasonDiv').hide();
	        }
	    });
	    $('#completedTaskStatus').change(function () {
	    	console.log("inside parkingdiv")
	        var selectedStatus = $(this).val();
	        if (selectedStatus === 'parked') {
	            $('#completedParkingReasonDiv').show();
	        } 
	    });
	function deletefn(tasksId) {
		console.log("tasksId")
		console.log(tasksId)
		$(".modal-body #tasksIdForDelete").val(tasksId);
		$("#deleteTask").modal();
	}	
	 function test(parkingReason, simLink, startDate,endDate, taskName, taskStatus) {
	$(".modal-body #SIMLink").val(simLink);
	$(".modal-body #completedParkingReason").val(parkingReason);
	$(".modal-body #startDate").val(startDate);
	$(".modal-body #endDate").val(endDate);
	$(".modal-body #completedTaskStatus").val(taskStatus);
	document.getElementById("dynamicCompletedTask").innerText = taskName+" Details";
	if (taskStatus === 'parked') {
        $('#completedParkingReasonDiv').show();
    } else{
    	$('#completedParkingReasonDiv').hide();
    }
    $("#completedTask").modal();
    
    
	} 
	 function test1(parkingReason, simLink, id, startDate,endDate, status, taskName) {
		 /* console.log(simLink)
		 console.log(parkingReason) */
		 console.log(taskName)
 	$(".modal-body #SIMLink").val(simLink);
	$(".modal-body #parkingReason").val(parkingReason); 
	$(".modal-body #tasksIdForUpdate").val(id); 
	$(".modal-body #startDate").val(startDate);
	$(".modal-body #endDate").val(endDate);
	$(".modal-body #taskStatus").val(status);
/* 	$(".modal-title #dynamicTaskName").val(endDate); */
 	document.getElementById("dynamicTaskName").innerText = "Update "+taskName+" Details";
	/* $(".modal-title #dynamicTaskName").val(taskName); */
    $("#updateTaskModal").modal();
	} 
	
     function tnameValidate(id,frameId)
    {
        var isValid = false
         var tn=document.getElementById(id);
             if(tn.value.trim() === "" )
             {
               tn.style.border="solid 3px red";
                 var container = document.getElementById(frameId);
                 container.style.visibility = 'visible';
                 isValid = false;
             }
               else
               {
                  /* tn.style.border = "solid 3px green"; */
                 tn.style.border ="";
                  var container = document.getElementById(frameId); 
                  container.style.visibility = 'hidden';
                  isValid = true;
               }
             return isValid;
    }
    
    function validate()
    {
       var isValidtname = tnameValidate('taskName',"tname")
       var isValidStartDate =  tnameValidate('startDate', "sdate")
       if(isValidtname && isValidStartDate) {
    	   return true;
       }
       return false;
       
    } 
    
     function validateForm(){
    	var taskName = document.getElementById("taskName").value.trim();
    	var taskNameError = document.getElementById("taskNameError");
    	
    	if(taskName == ""){
    		taskNameError.textContent = "Task Name is required";
    		return false;
    	}
    	else{
    		taskNameError.textContent="";
    		return true;
    	} 
    }   
     
     /* $(document).ready(function() {
    	    var table = $('#taskDataTable').DataTable({
    	        searchPanes: true
    	    });
    	    table.searchPanes.container().prependTo(table.table().container());
    	    table.searchPanes.resizePanes();
    	}); */
     /* <script> */
     /* $(function() {
       $('#taskDataTable').bootstrapTable()
     }) */
     
    /*  function filterTable() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  
  input = document.getElementById("statusFilterDropDown");
  
  filter = input.value.toUpperCase();
  table = document.getElementById("taskDataTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}\ */
     
     function searchTable(tableName, modelName) {
    	  // Declare variables
    	  var input, filter, table, tr, td, i, txtValue;
    	  
    	  input1 = document.getElementById(modelName);
    	  input = document.getElementById("statusFilterDropDown");
    	  filter1 = input.value.toUpperCase();
    	  filter = input1.value.toUpperCase();
    	  table = document.getElementById(tableName);
    	  tr = table.getElementsByTagName("tr");
    	  
    	  // Loop through all table rows, and hide those who don't match the search query
    	  
    	  for (i = 0; i < tr.length; i++) {
    		  
    	    td0 = tr[i].getElementsByTagName("td")[0];
    	    td1 = tr[i].getElementsByTagName("td")[1];
    	    td2 = tr[i].getElementsByTagName("td")[2];
    	    td3 = tr[i].getElementsByTagName("td")[3];
    	    
    	    if (td0 || td1 || td2 || td3) {
    	    	txtValue0 = td0.textContent || td0.innerText;
    	    	txtValue1 = td1.textContent || td1.innerText;
    	    	txtValue2 = td2.textContent || td2.innerText;
    	    	txtValue3 = td3.textContent || td3.innerText;
    	      
    	      if ((txtValue0.toUpperCase().indexOf(filter) > -1 || txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1 || txtValue3.toUpperCase().indexOf(filter) > -1) && txtValue1.toUpperCase().indexOf(filter1) > -1 ){    	        
    	    	  tr[i].style.display = "";
    	      } else {
    	        tr[i].style.display = "none";
    	      }
    	    }   
    		  }
    	  
     
    	}
    	
function searchCompletedTable(tableName, modelName) {
	  // Declare variables
	  var input, filter, table, tr, td, i, txtValue;
	  
	  input = document.getElementById(modelName);
	  filter = input.value.toUpperCase();
	  table = document.getElementById(tableName);
	  tr = table.getElementsByTagName("tr");
	  // Loop through all table rows, and hide those who don't match the search query
	  
	  for (i = 0; i < tr.length; i++) {
		  
	    td0 = tr[i].getElementsByTagName("td")[0];
	    td1 = tr[i].getElementsByTagName("td")[1];
	    td2 = tr[i].getElementsByTagName("td")[2];
	    td3 = tr[i].getElementsByTagName("td")[3];
	    
	    if (td0 || td1 || td2 || td3) {
	    	txtValue0 = td0.textContent || td0.innerText;
	    	txtValue1 = td1.textContent || td1.innerText;
	    	txtValue2 = td2.textContent || td2.innerText;
	    	txtValue3 = td3.textContent || td3.innerText;
	      
	      if ((txtValue0.toUpperCase().indexOf(filter) > -1 || txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1 || txtValue3.toUpperCase().indexOf(filter) > -1)){    	        
	    	  tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }   
		  }
	  

	}
$('#statusFilterDropDown').on( 'change', function () {
	  $('#alltasksDataTable').DataTable().column( 1 ).search(
	    $('#statusFilterDropDown').val()
	  ).draw();
	});
/* new DataTable('#alltasksDataTable', {
    pagingType: 'simple_numbers'
}); */
/* $(document).ready(function () {
    var table = $('#completedTaskDataTable').DataTable({
       "paging": true,
       "pageLength": 3
    });
 }); */
 /* $(document).ready(function() { 
     $('#alltasksDataTable').DataTable({ }); 
 });  */
		
   </script>
</script>

</body>
</html>