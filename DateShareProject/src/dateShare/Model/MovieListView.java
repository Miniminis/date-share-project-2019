package dateShare.Model;

import java.util.List;

public class MovieListView {
	private int totalArticleCnt; //전체 게시글 수 
	private List<Movie> movieList; //등록된 메시지 리스트 
	
	public MovieListView () {}
	
	public MovieListView(int totalArticleCnt, List<Movie> movieList) {
		this.totalArticleCnt = totalArticleCnt;
		this.movieList = movieList;
	}


	public int getTotalArticleCnt() {
		return totalArticleCnt;
	}


	public void setTotalArticleCnt(int totalArticleCnt) {
		this.totalArticleCnt = totalArticleCnt;
	}


	public List<Movie> getMovieList() {
		return movieList;
	}


	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}


	@Override
	public String toString() {
		return "MovieListView [totalArticleCnt=" + totalArticleCnt + ", movieList=" + movieList + "]";
	}
	
	//게시글  리스트가 0일때 전체 메시지 개수 
	public boolean isEmpty() {
		return totalArticleCnt ==0; 
	}
}

