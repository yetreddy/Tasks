<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<!-- Page Wrapper -->
<div class="container mt-3">

    <!-- Delete Task Button -->
    <button class="btn btn-danger ml-2" data-toggle="modal" data-target="#deleteTaskModal">Delete Task</button>

    <!-- Update Task Modal -->
    <div class="modal" id="updateTaskModal">
        <!-- ... (your existing update task modal content) -->
    </div>

    <!-- Delete Task Modal -->
    <div class="modal" id="deleteTaskModal">
        <div class="modal-dialog modal-dialog-right">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Delete Task</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <!-- Justification Form -->
                    <form id="deleteTaskForm">
                        <div class="form-group">
                            <label for="justification">Justification</label>
                            <textarea class="form-control" id="justification" name="justification" rows="3" required></textarea>
                        </div>
                        <!-- Delete Button -->
                        <button type="button" class="btn btn-danger float-right" id="performDeleteBtn">Delete Task</button>
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

<!-- Additional Script for Delete Task Modal -->
<script>
    // Delete Task Button Click Event
    $('#performDeleteBtn').click(function () {
        // Get justification from the form
        var justification = $('#justification').val();

        // Add your logic here to perform the task deletion or any other actions

        // Clear the form
        $('#justification').val('');

        // Close the modal
        $('#deleteTaskModal').modal('hide');
    });
</script>

</body>
</html>