package prepare;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class B20200316 {
	
	public String solution(String[] participant, String[] completion) {
		
		String answer = "";		
		
		Arrays.sort(participant);
		Arrays.sort(completion);
		
		for(int i = 0 ; i < completion.length ; i++) {
			if(!participant[i].equals(completion[i])) {
				answer = participant[i];
			}else {
				answer = participant[participant.length-1];
			}
		}
		
		
		
        return answer;
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String [] participant = {"mislav", "stanko", "mislav", "ana"};
		String [] completion = {"stanko", "ana", "mislav"};
		B20200316 a = new B20200316();
		System.out.println(a.solution(participant, completion));

	}

}
