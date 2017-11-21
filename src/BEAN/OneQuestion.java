package BEAN;

public class OneQuestion {

	private int questionid;
	private String question;
	private int questionnumber;
	private String questioncontent;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String answerquestion;

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getQuestionnumber() {
		return questionnumber;
	}

	public void setQuestionnumber(int questionnumber) {
		this.questionnumber = questionnumber;
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

	public String getAnswerquestion() {
		return answerquestion;
	}

	public void setAnswerquestion(String answerquestion) {
		this.answerquestion = answerquestion;
	}

	public String getQuestioncontent() {
		return questioncontent;
	}

	public void setQuestioncontent(String questioncontent) {
		this.questioncontent = questioncontent;
	}

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}

}
