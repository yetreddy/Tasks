<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg btn-link" data-toggle="modal" data-target="#completedTask">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="completedTask" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <form>
        <div class="modal-body">
          <div class="form-group">
                        <%-- <input type="hidden" name="tasksId" value="${tempStudent.id}" /> --%>
                            <label for="taskStatus">Status</label>
                            <select class="form-control" id="taskStatus" name="taskStatus">
                                <option value="pending">Pending</option>
                                <option value="completed">Completed</option>
                                <option value="WIP">Work in Progress</option>
                                <option value="parked">Parked</option>
                            </select>
                        </div>
                        <div class="form-group" id="parkedReasonDiv" style="display: none;">
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
                        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  


</body>
</html>
