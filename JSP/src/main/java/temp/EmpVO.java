package temp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
//@AllArgsConstructor		// 인자 있는 생성자

//@Setter 
//@Getter
//@NoArgsConstructor		// 인자 없는 생성자
//@ToString					// 출력
@Data						// Setter+Getter+NoArgsConstructor+ToString을 한 번에!!
public class EmpVO {
	
	private int empno;
	private String ename;
	private String job;
	private int sal;
	private int deptno;


}
