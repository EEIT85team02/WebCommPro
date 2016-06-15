package fileIO.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import Class.model.ClassVO;
import Edu.model.EduVO;
import Student.model.StudentVO;

public class FileIOUtil {
	private ArrayList<String[]> dataRow = new ArrayList<String[]>();
	private ArrayList<StudentVO> studentRowVO = new ArrayList<StudentVO>();

	public ArrayList<String[]> getDataRow() {
		return dataRow;
	}

	public void setDataRow(ArrayList<String[]> dataRow) {
		this.dataRow = dataRow;
	}

	public ArrayList<StudentVO> getStudentRowVO() {
		return studentRowVO;
	}

	public void setStudentRowVO(ArrayList<StudentVO> studentRowVO) {
		this.studentRowVO = studentRowVO;
	}

	public ArrayList<StudentVO> uploadCSV(File realPath){

		try (	//BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(realPath)));
//				BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(UploadStudentServlet.class.getResource("*.csv").getFile())))){
				BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(realPath+"\\test01.csv")))){
//			BufferedReader in = new BufferedReader(new InputStreamReader(UploadStudentServlet.class.getResourceAsStream("test01.csv")))){
//				BufferedReader in = new BufferedReader(new FileReader(new File("C:\\Users\\pighouse\\Desktop\\test01.csv")))){ 
			String str;
//			System.out.println(in.getClass().getName());
			while((str=in.readLine())!=null){
				dataRow.add(str.split(","));		
			}


			//印出
			for(String[] da:dataRow){
				for(String dad:da){
					System.out.print(dad+"\t");
				}
				System.out.println();
			}			
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=1;i<dataRow.size();i++){
				studentRowVO.add(new StudentVO());
				studentRowVO.get(i-1).setStu_name((dataRow.get(i)[0]));
				studentRowVO.get(i-1).setStu_age(new Integer(dataRow.get(i)[1]));
				studentRowVO.get(i-1).setStu_sex(new Integer(dataRow.get(i)[2].replace("男", "1").replace("女", "0")));
				studentRowVO.get(i-1).setStu_sch(((dataRow.get(i)[3])));
				studentRowVO.get(i-1).setStu_group((new Integer(dataRow.get(i)[4])));
				studentRowVO.get(i-1).setStu_seatno(((new Integer(dataRow.get(i)[5]))));
				studentRowVO.get(i-1).setStu_email(((dataRow.get(i)[6])));
				studentRowVO.get(i-1).setStu_pre((new Integer(dataRow.get(i)[7].replace("是", "1").replace("否", "0"))));
				studentRowVO.get(i-1).setStu_implement(((new Double(dataRow.get(i)[8]))));
				studentRowVO.get(i-1).setStu_testtime(new Timestamp(formatter.parse((dataRow.get(i)[9].replaceAll("/","-"))).getTime()));
				studentRowVO.get(i-1).setStu_interview((((new Double(dataRow.get(i)[10])))));
				studentRowVO.get(i-1).setStu_total(((((new Double(dataRow.get(i)[11]))))));
				studentRowVO.get(i-1).setStu_workdate(new Timestamp(formatter.parse((dataRow.get(i)[12].replaceAll("/","-"))).getTime()));
				studentRowVO.get(i-1).setStu_except((((((new Double(dataRow.get(i)[13])))))));
				studentRowVO.get(i-1).setStu_final(((new Integer(dataRow.get(i)[14].replace("是", "1").replace("否", "99")))));
				studentRowVO.get(i-1).setStu_note1((((dataRow.get(i)[15])))); //備註欄位
				studentRowVO.get(i-1).setStu_note2((((dataRow.get(i)[16])))); //備註欄位
				ClassVO classVO = new ClassVO();
				classVO.setClass_id((((dataRow.get(i)[17]))));
				studentRowVO.get(i-1).setClassVO(classVO);
			}
			//			out.write(str);

		} catch (FileNotFoundException e) {
			//			e.printStackTrace();
			return null;
		} catch (IOException e) {
			//			e.printStackTrace();
			return null;
		} catch (ParseException e) {
			System.out.println("日期解析失敗");
			e.printStackTrace();
		}
		return studentRowVO;
	}








}