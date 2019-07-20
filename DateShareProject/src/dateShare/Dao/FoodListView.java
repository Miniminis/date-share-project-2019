package dateShare.Dao;

import java.util.List;

import dateShare.Model.Food;

public class FoodListView {

	private int foodTotalCount;
	private int currentPageNumber;
	private List<Food> foodList;
	private int pageTotalCount;
	private int foodCountPerPage;
	private int firstRow;
	private int endRow;

	public FoodListView(int foodTotalCount, int currentPageNumber, List<Food> foodList, int foodCountPerPage,
			int firstRow, int endRow) {
		this.foodTotalCount = foodTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.foodList = foodList;
		this.foodCountPerPage = foodCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (foodTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = foodTotalCount / foodCountPerPage;
			if (foodTotalCount % foodCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getFoodTotalCount() {
		return foodTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Food> getFoodList() {
		return foodList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getFoodCountPerPage() {
		return foodCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return foodCountPerPage == 0;
	}
}
