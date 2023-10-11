package temp;

public class DBDriverLoad {
	
	// 다른 곳에서 쓸 수 없음.
	private DBDriverLoad() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	// 싱글톤 패턴 : 단 한번만
	static DBDriverLoad dbdriver = null;
	public static void getInstance() {
		if(dbdriver == null ) {
			dbdriver = new DBDriverLoad();
		}
	}

}
