package dateShare.service.food;

public class FoodNotFoundException extends Exception {

	// 알트 쉬프트 S 해서 슈퍼클래스의 생성자 생성.. 스트링 받는 애 하나 만들어줬따
	public FoodNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

}
