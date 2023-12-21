package kr.or.ddit.collection;

import java.util.ArrayList;
import java.util.List;

public class Manager {

	private List<People> peopleList = new ArrayList<>();

	public List<People> getPeopleList() {
		return peopleList;
	}

	public void setPeopleList(List<People> peopleList) {
		this.peopleList = peopleList;
	}

	public static void main(String[] args) {
		Manager manager = new Manager();
		List<People> peopleList = manager.getPeopleList();

		People student1 = new Student("유관순", "여성", 10, 3, 1, 1);
		People student2 = new Student("가나다", "남성", 11, 4, 2, 2);
		People student3 = new Student("라마바", "여성", 12, 5, 3, 3);
		People student4 = new Student("사아자", "나성", 13, 6, 4, 4);
		People student5 = new Student("차카타", "여성", 13, 6, 5, 5);

		peopleList.add(student1);
		peopleList.add(student2);
		peopleList.add(student3);
		peopleList.add(student4);
		peopleList.add(student5);

		People teacher1 = new Teacher("선생님1", "여성", 35, "정교사","담임교사");
		People teacher2 = new Teacher("선생님2", "남성", 30, "정교사","담임교사");
		People teacher3 = new Teacher("선생님3", "여성", 28, "기간제","일반교사");

		peopleList.add(teacher1);
		peopleList.add(teacher2);
		peopleList.add(teacher3);

		for (People people : peopleList) {
			System.out.println(people);
		}

	}

}
