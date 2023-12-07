<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Task </title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<!-- Page Wrapper -->
<div class="container mt-3">

    <!-- Update Task Button -->
  <button class="btn btn-primary" data-toggle="modal" data-target="#updateTaskModal">Update Task</button>

    <!-- Update Task Modal -->
    <div class="modal" id="updateTaskModal">
        <div class="modal-dialog modal-dialog-right">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Update Task</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <!-- Form for updating tasks -->
                    <form id="updateTaskForm" action="CreateTaskServlet" method="get">
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
                            <label for="parkedReason">Reason for Parking:</label>
                            <textarea class="form-control" id="parkedReason" name="parkedReason" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="simpleLink">Simple Link:</label>
                            <input type="text" class="form-control" id="simpleLink" name="simpleLink">
                        </div>
                        <div class="form-group">
                            <label for="startDate">Start Date:</label>
                            <input type="date" class="form-control " id="startDate" name="startDate" required>
                        </div>
                        <div class="form-group">
                            <label for="endDate">End Date:</label>
                            <input type="date" class="form-control " id="endDate" name="endDate" required>
                        </div>
                        <!-- Update Button -->
                        <button type="button" class="btn btn-primary float-right" id="performUpdateBtn">Update Details</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap JS and Popper.js (required for Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Bootstrap Datepicker JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
    // Initialize datepickers
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
    });

    // Update Task Button Click Event
    $('#performUpdateBtn').click(function () {
        // Get task details from the form
        var taskStatus = $('#taskStatus').val();
        var simpleLink = $('#simpleLink').val();
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        var parkedReason = $('#parkedReason').val();

        // Add your logic here to perform the task update or any other actions

        // Clear the form
        $('#taskStatus, #simpleLink, #startDate, #endDate, #parkedReason').val('');

        // Close the modal
        $('#updateTaskModal').modal('hide');
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
</script>

</body>
</html>