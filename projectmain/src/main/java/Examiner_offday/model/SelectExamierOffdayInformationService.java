package Examiner_offday.model;

public class SelectExamierOffdayInformationService {
	
	
	public Examiner_offdayVO SelectExamierVOByEmpId(String emp_id){
		Examiner_offdayDAO eodao =new Examiner_offdayDAO();
		Examiner_offdayVO selectedExaminerOffdaydata=eodao.findByPrimaryKey(emp_id);

		return selectedExaminerOffdaydata;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
