package model;

import java.util.Random;

public class SSe {

	public static void main(String[] args) {
		NutrientDao nutrientDao = new NutrientDao();
			for(int i=2; i<=10; i++) {//i가 
				nutrientDao.like(114,106);
				System.out.println(i+"번쨰");
			}
	}

}
