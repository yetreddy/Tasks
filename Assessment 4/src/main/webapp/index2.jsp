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
                
                <!-- Right Side Modal Dialogue Trigger -->
                <div class="col-md-6">
                    <button class="btn btn-link float-right" data-toggle="modal" data-target="#addTaskModal">Add New Task</button>
                </div>
            </div>
        </div>

        <!-- Completed Tasks Tab -->
        <div class="tab-pane fade" id="completedTasks">
            <h2>Completed Tasks</h2>
           
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
            <form id="addTaskForm" action="CreateTaskServlet" method="post">
            <input type="hidden" name="command" value="CREATE"/>
            
            <div class="modal-body">
                <!-- Form for adding tasks -->
                    
                    <div class="form-group">
                    
                        <label class ="required" for="taskName">Task Name</label>
                        <input type="text" class="form-control" id="taskName" name="taskName" >
                        <label id="tname" style="color : red; visibility: hidden;">Please enter task name</label>
                    </div>
                    <div class="form-group">
                        <label for="SIM Link">SIM Link</label>
                        <input class="form-control" id="SIM Link" name="SIMLink" rows="3"></input>
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
<div id="container">
		 	<div id="content">
		 	
		 	<input type="hidden" name="command" value="LIST" return false;"
		 	class = "CreateTaskServlet"/>
		 		<table border = "4" width = "100%">
		 			<tr>
		 			<th>Task Name</th>
		 			<th>Last Name</th>
		 			<th> Email</th>
		 			<th>Phone Number</th>
		 			<th>About</th>
		 			<th>PreferredLanguage</th>
		 			<th>Joining Date</th>
		 			
		 			</tr>
		 			<c:forEach var="tempStudent" items="${tasksList}">
		 			<c:url var="templink" value="CreateTaskServlet">
		 				<c:param name="command" value="LOAD"/>
		 				<c:param name="studentId" value="${tempStudent.id }"/>
		 			</c:url>
		 				
		 			<c:url var="deletelink" value="StudentControllerServlet">
		 				<c:param name="command" value="DELETE"/>
		 				<c:param name="studentId" value="${tempStudent.id }"/>
		 			
		 			</c:url>
		 			<tr>
		 			<td> ${tempStudent.taskName} </td>
		 			<%-- <td> ${tempStudent.lastName} </td>
		 			<td> ${tempStudent.email}</td>
		 			<td> ${tempStudent.phoneNumber}</td>
		 			<td> ${tempStudent.about}<td>
		 			<td> ${tempStudent.preferredLanguage}<td>
		 			<td> ${tempStudent.joiningDate}</td>
		 			<td> <a href="${templink }">Update</a> --%>
		 			     |
		 			     <a href="${deletelink}" onclick="if(!(confirm('Are you sure you want to delete this student'))) return false">Delete</a>
		 			
		 			</td>
		 			
		 			
		 			</tr>
		 			</c:forEach>
		 		
		 		</table>
		 	
		 	</div>
		 
		 </div>

<!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Bootstrap Datepicker JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
	//Initialize datepickers
	 $('.datepicker').datepicker({
	    format: 'yyyy-mm-dd',
	    autoclose: true,
	    todayHighlight: true
	}); 

    // Save Task Button Click Event
    $('#saveTaskBtn').click(function () {
        // Get task details from the form
        var taskName = $('#taskName').val();
        var taskDescription = $('#taskDescription').val();
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val(); 
		
        var isValid = tnameValidate('taskName',"tname"); 
        // Add your logic here to save the task details or perform any other actions
        let tasks = request.getAttribute("TASKS");
    
        console.log(tasks)
        if(isValid) {
            var form = document.getElementById("addTaskForm");
            form.submit();
         // Close the modal
            $('#addTaskModal').modal('hide');
            // Clear the form
            $('#taskName, #taskDescription, #startDate, #endDate').val('');
        }	
        
		

        
    });
	
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
                  tn.style.border = "solid 3px green";
                 
                  var container = document.getElementById(frameId); 
                  container.style.visibility = 'hidden';
                  isValid = true;
               }
             return isValid;
    }
    
    function validate()
    {
       var isValidtname = tnameValidate('taskName',"tname")
       
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
    	
    	
    
</script>

</body>
</html>