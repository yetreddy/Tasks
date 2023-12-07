

public class Tasks {
	
	private int id;
	private String taskName;
	private String simLink;
	private String startDate;
	private String endDate;
	private String status;
	private String isActive;
	private String parkingReason;
	private String deleteJustification;
	
	public String getDeleteJustification() {
		return deleteJustification;
	}
	public void setDeleteJustification(String deleteJustification) {
		this.deleteJustification = deleteJustification;
	}
	public String getParkingReason() {
		return parkingReason;
	}
	public void setParkingReason(String parkingReason) {
		this.parkingReason = parkingReason;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getSimLink() {
		return simLink;
	}
	public void setSimLink(String simLink) {
		this.simLink = simLink;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Tasks(int id, String taskName, String simLink, String startDate, String endDate, String status) {
		super();
		this.id = id;
		this.taskName = taskName;
		this.simLink = simLink;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		}
	public Tasks(int id2, String taskName2, String simLink2, String startDate2, String endDate2, String status2,
			String parkingReason2) {
		super();
		this.id = id2;
		this.taskName = taskName2;
		this.simLink = simLink2;
		this.startDate = startDate2;
		this.endDate = endDate2;
		this.status = status2;
		this.parkingReason= parkingReason2;
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Tasks [id=" + id + ", taskName=" + taskName + ", simLink=" + simLink + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", status=" + status + ", isActive=" + isActive + ", parkingReason="
				+ parkingReason + ", deleteJustification=" + deleteJustification + "]";
	}
	
	
}
