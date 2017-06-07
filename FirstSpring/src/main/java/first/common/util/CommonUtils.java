package first.common.util;

import java.util.UUID;

public class CommonUtils {
     
	//서버에 저장될 파일명의 글자 수 만큼, 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능
	// 지금은 파일 생성에만 사용될 것이라 클래스를 따로 만들어줄 필요는 없지만, 나중에 적용할 때 다른 기능을 추가하기 위해 분리. 
    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}

