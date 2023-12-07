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
                </div>
                <div class="col-md-6">
                    <button class="btn btn-link float-right" data-toggle="modal" data-target="#addTaskModal">Add New Task</button>
                </div>
            </div>
            <div class="container mt-3">
 <div id="container"> 
		 	<div id="content">
		 	<div class="form-group col-md-2 float-right" >
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
		 			 <c:forEach var="tempUpdateTask" items="${allTasksList}">
		 			<tr>
		 			<td> <a href="#" id="updateTaskBtn" onclick="updateTaskfn('${tempUpdateTask.parkingReason}','${tempUpdateTask.simLink}','${tempUpdateTask.id}','${tempUpdateTask.startDate}','${tempUpdateTask.endDate}','${tempUpdateTask.status}', '${tempUpdateTask.taskName}');">${tempUpdateTask.taskName}</a></td>
		 			<td> ${tempUpdateTask.status} </td>
		 			<td> ${tempUpdateTask.startDate}</td>
		 			<td> ${tempUpdateTask.endDate}</td>
		 			<td><button type="button" class="btn btn-outline-secondary btn-block" onclick="deletefn('${tempUpdateTask.id}');"><strong>Delete</strong></button></td>
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
            <form id="completedTaskForm">
            <table border = "4" width = "100%" id="completedTaskDataTable">
            <thead>
            <tr>
            	<th>Task Name</th>
            	<th>Status</th>
            	<th>Start Date</th>
            	<th>End Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tempCompletedtask" items="${completedTasksList}">
		 			<tr>
		 			<td id="completedTaskName"> <a href="#" id="completeTaskDialog" onclick="completedTaskfn('${tempCompletedtask.parkingReason}','${tempCompletedtask.simLink}','${tempCompletedtask.startDate}','${tempCompletedtask.endDate}', '${tempCompletedtask.taskName}', '${tempCompletedtask.status}');">${tempCompletedtask.taskName}</a></td>
		 			<td> ${tempCompletedtask.status} </td>
		 			<td> ${tempCompletedtask.startDate}</td>
		 			<td> ${tempCompletedtask.endDate}</td>
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
                            <label for="completedSimLink">SIM Link:</label>
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
                        <button type="button" class="btn btn-primary float-right" id="deleteBtn">Delete Task</button>
                        </div>
                        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>   
    </div>
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
                            <label for="updateSimLinkLabel">SIM Link:</label>
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
	}); 
	});
$(document).ready(function () { 
	$('#completedTaskDataTable').DataTable({ 
	}); 
	});

	//Initialize datepickers
	 $('.datepicker').datepicker({
	    format: 'yyyy-mm-dd',
	    autoclose: true,
	    todayHighlight: true
	}); 
	 
	 $('.document').ready(function(){
		  $("#updateTaskBtn").click(function(){
		    $("#updateTaskModal").modal();
		    
		  });
		}); 
	
    // Save Task Button Click Event
    $('#saveTaskBtn').click(function () {
        // Get task details from the form
        var taskName = $('#taskName').val();
        var taskDescription = $('#taskDescription').val();
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val(); 
        var isValid = validate('taskName', 'startDate', "tname", "startDate")
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
        var taskDescription = $('#taskDescription').val();
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val(); 
		var taskId = $('#tasksId').val();
        var isValid = tnameValidate('taskName',"tname"); 
        var SIMLink = $('#SIMLink').val();
        var taskStatus1 = $('#taskStatus1').val();
        var parkingReason = $('#parkingReason').val();
        // Add your logic here to save the task details or perform any other actions
        var form = document.getElementById("updateTaskForm");
        form.submit();
        $('#updateTaskModal').modal('hide');
        // Clear the form
        $('#taskName, #taskDescription, #startDate, #endDate, #SIMLink, #tasksId,#deleteJustification, #parkingReason').val('');
    });
	 
	 $('#deleteBtn').click(function () {
	        // Get task details from the form
	       
	        var taskDescription = $('#taskDescription').val();
	        var startDate = $('#startDate').val();
	        var endDate = $('#endDate').val(); 
			var id = $('#tasksIdForDelete').val();
	        var isValid = tnameValidate('taskName',"tname"); 
	        var tasksId = $('#tasksIdForDelete').val();
	        // Add your logic here to save the task details or perform any other actions
	        
	        var form = document.getElementById("deleteTaskForm");
	        form.submit();
	        $('#deleteTask').modal('hide');
	        $('#taskName, #taskDescription, #startDate, #endDate, #SIMLink, #tasksId,#deleteJustification, #parkingReason').val('');
	    });
	// Show/hide the parked reason textarea based on selected status
	    $('#taskStatus').change(function () {
	        var selectedStatus = $(this).val();
	        if (selectedStatus === 'parked') {
	            $('#parkedReasonDiv').show();
	        } else {
	            $('#parkedReasonDiv').hide();
	        }
	    });
	    $('#completedTaskStatus').change(function () {
	        var selectedStatus = $(this).val();
	        if (selectedStatus === 'parked') {
	            $('#completedParkingReasonDiv').show();
	        } 
	    });
	function deletefn(tasksId) {
		$(".modal-body #tasksIdForDelete").val(tasksId);
		$("#deleteTask").modal();
	}	
	function completedTaskfn(parkingReason, simLink, startDate,endDate, taskName, taskStatus) {
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
	function updateTaskfn(parkingReason, simLink, id, startDate,endDate, status, taskName) {
 	$(".modal-body #SIMLink").val(simLink);
	$(".modal-body #parkingReason").val(parkingReason); 
	$(".modal-body #tasksIdForUpdate").val(id); 
	$(".modal-body #startDate").val(startDate);
	$(".modal-body #endDate").val(endDate);
	$(".modal-body #taskStatus").val(status);
 	document.getElementById("dynamicTaskName").innerText = "Update "+taskName+" Details";
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

    $('#statusFilterDropDown').on( 'change', function () {
	  $('#alltasksDataTable').DataTable().column( 1 ).search(
	    $('#statusFilterDropDown').val()
	  ).draw();
	});
		
   </script>
</script>

</body>
</html>