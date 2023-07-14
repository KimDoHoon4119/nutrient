package model;
/*
 * Bean 클래스
 * 프로퍼티(property)
 * 	get 프로퍼티 : getId() -> id (get 프로퍼티)
 * 				 getXxx => xxx
 * 
 * 	set 프로퍼티 : setId(object) -> id (set 프로퍼티)
 * 				 setAbc => abc
 * 
 * 
 */

public class Member {
	private int no;
	private String name;
	private String id;
	private String pass;
	private int gender; 
	private String tel;
	private String email;
	private String weight;
	private String height;
	private String beat;
	//getter, setter, toString
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getBeat() {
		return beat;
	}
	public void setBeat(String beat) {
		this.beat = beat;
	}
	@Override
	public String toString() {
		return "Member [no=" + no + ", name=" + name + ", id=" + id + ", pass=" + pass + ", gender=" + gender + ", tel="
				+ tel + ", email=" + email + ", weight=" + weight + ", height=" + height + ", beat=" + beat + "]";
	}
	
	
	
	
}
