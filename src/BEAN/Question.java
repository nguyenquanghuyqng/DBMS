package BEAN;

public class Question {
	
	private int questionid;
	private int readnumber;
	private String readcontent;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String correctanswer;
	private int readtestid;
	private int testid;

	public Question() {
	}

	public Question(int questionid, int readnumber, String readcontent, String option1, String option2, String option3,
			String option4, String correctanswer, int readtestid, int testid) {
		this.questionid = questionid;
		this.readnumber = readnumber;
		this.readcontent = readcontent;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctanswer = correctanswer;
		this.readtestid = readtestid;
		this.testid = testid;
	}

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

	public int getReadnumber() {
		return readnumber;
	}

	public void setReadnumber(int readnumber) {
		this.readnumber = readnumber;
	}

	public String getReadcontent() {
		return readcontent;
	}

	public void setReadcontent(String readcontent) {
		this.readcontent = readcontent;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getCorrectanswer() {
		return correctanswer;
	}

	public void setCorrectanswer(String correctanswer) {
		this.correctanswer = correctanswer;
	}

	public int getReadtestid() {
		return readtestid;
	}

	public void setReadtestid(int readtestid) {
		this.readtestid = readtestid;
	}

	public int getTestid() {
		return testid;
	}

	public void setTestid(int testid) {
		this.testid = testid;
	}

	
}
