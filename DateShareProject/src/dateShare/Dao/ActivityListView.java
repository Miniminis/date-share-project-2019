package dateShare.Dao;

import java.util.List;

import dateShare.Model.Activity;

public class ActivityListView {

	private int activityTotalCount;
	private int currentPageNumber;
	private List<Activity> activityList;
	private int pageTotalCount;
	private int activityCountPerPage;
	private int firstRow;
	private int endRow;

	public ActivityListView(int activityTotalCount, int currentPageNumber, List<Activity> activityList,
			int activityCountPerPage, int firstRow, int endRow) {
		this.activityTotalCount = activityTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.activityList = activityList;
		this.activityCountPerPage = activityCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (activityTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = activityTotalCount / activityCountPerPage;
			if (activityTotalCount % activityCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getActivityTotalCount() {
		return activityTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Activity> getActivityList() {
		return activityList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getActivityCountPerPage() {
		return activityCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return activityCountPerPage == 0;
	}
}
