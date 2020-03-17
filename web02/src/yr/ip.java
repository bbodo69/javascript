package yr;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class ip {

	public static void main(String[] args) {
		
		InetAddress local = null;
		
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String ip = local.getHostAddress();
		
		System.out.println(ip);
		
	}

}
