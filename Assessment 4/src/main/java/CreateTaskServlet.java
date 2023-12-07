

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;    


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CreateTaskServlet
 */
@WebServlet("/CreateTaskServlet")
public class CreateTaskServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");

			// if the command is missing, then default to listing tasks
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				tasksList(request, response);
				break;
				
			case "CREATE":
				createTask(request, response);
				break;
				
			case "COMPLETE_TASKS":
				completeTasks(request, response);
				break;
			
			case "UPDATE":
				updateTask(request, response);
				break;
			case "DELETE":
				deleteTask(request,response);
				break;
							
			default:
				tasksList(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	private void createTask(HttpServletRequest request, HttpServletResponse response) {
		String tname =request.getParameter("taskName");
		String slink =request.getParameter("SIMLink");
		String sdate =request.getParameter("startDate");
		String edate=request.getParameter("endDate");
		if(edate.equals("")) {
			LocalDateTime now = LocalDateTime.now();  
		    edate= now.toString();
		}
				
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tasks_schema","root","Nokia@6.19");
			
			PreparedStatement ps = con.prepareStatement("insert into tasks (task_name, sim_link, start_date, end_date) values(?,?,?,?)");
			
			ps.setString(1, tname);
			ps.setString(2, slink);
			ps.setString(3, sdate);
			ps.setString(4, edate);
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect(request.getContextPath() + "/CreateTaskServlet?command=LIST");
				return;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
public void tasksList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Tasks> tasksList = new ArrayList<>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tasks_schema","root","Nokia@6.19");
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// create sql statement
			String sql = "select * from tasks where status in ('pending','WIP') and is_active=1";
			
			myStmt = myConn.prepareStatement(sql);
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String taskName = myRs.getString("task_name");
				String simLink = myRs.getString("sim_link");
				String startDate = myRs.getString("start_date");
				String endDate = myRs.getString("end_date");
				String status = myRs.getString("status");
				
				// create new student object
				Tasks tasks = new Tasks(id,taskName, simLink, startDate, endDate,status);

				tasksList.add(tasks);				
			}
			completeTasks(request, response);
			request.setAttribute("allTasksList", tasksList);
			// send to JSP page (view)
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
	}

public void completeTasks(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	List<Tasks> completedTasksList = new ArrayList<>();
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tasks_schema","root","Nokia@6.19");
	PreparedStatement myStmt = null;
	ResultSet myRs = null;
	
	try {
		// create sql statement
		String sql = "select * from tasks where status in ('completed','parked') and is_active=1";
		
		myStmt = myConn.prepareStatement(sql);
		
		// execute query
		myRs = myStmt.executeQuery(sql);
		
		// process result set
		while (myRs.next()) {
			
			// retrieve data from result set row
			int id = myRs.getInt("id");
			String taskName = myRs.getString("task_name");
			String simLink = myRs.getString("sim_link");
			String startDate = myRs.getString("start_date");
			String endDate = myRs.getString("end_date");
			String status = myRs.getString("status");
			String parkingReason = myRs.getString("parking_reason");
			
			// create new student object
			Tasks tasks = new Tasks(id,taskName, simLink, startDate, endDate,status, parkingReason);

			completedTasksList.add(tasks);				
		}
		request.setAttribute("completedTasksList", completedTasksList);
//		// send to JSP page (view)

	}
	finally {
		// close JDBC objects
		close(myConn, myStmt, myRs);
	}		
}
private void updateTask(HttpServletRequest request, HttpServletResponse response) {
	String id = request.getParameter("tasksId");
	String tname =request.getParameter("taskName");
	String slink =request.getParameter("SIMLink");
	String status =request.getParameter("taskStatus");
	String parkingReason =request.getParameter("parkingReason");
	String sdate=request.getParameter("startDate");
	String edate=request.getParameter("endDate");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tasks_schema","root","Nokia@6.19");
		
		PreparedStatement ps = con.prepareStatement("UPDATE tasks_schema.tasks SET sim_link = ?, status=?, start_date=?,end_date=?, parking_reason=? WHERE id =?");

		ps.setString(1, slink);
		ps.setString(2, status);
		ps.setString(3, sdate);
		ps.setString(4, edate);
		ps.setString(5, parkingReason);
		ps.setString(6, id);
		int count = ps.executeUpdate();
		if(count > 0) {
			response.sendRedirect(request.getContextPath() + "/CreateTaskServlet?command=LIST");
			return;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
}
private void deleteTask(HttpServletRequest request, HttpServletResponse response) {
	String id = request.getParameter("tasksId");
	String deleteJustification =request.getParameter("deleteJustification");
	String slink =request.getParameter("SIMLink");
	String status =request.getParameter("taskStatus");
	String edate=request.getParameter("endDate");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tasks_schema","root","Nokia@6.19");
		
		PreparedStatement ps = con.prepareStatement("UPDATE tasks_schema.tasks SET is_active = 0, delete_justification=? WHERE id =?");
		
		ps.setString(1, deleteJustification);
		ps.setString(2, id);

		int count = ps.executeUpdate();
		if(count > 0) {
			response.sendRedirect(request.getContextPath() + "/CreateTaskServlet?command=LIST");
			return;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
}
private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close();   // doesn't really close it ... just puts back in connection pool
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}

