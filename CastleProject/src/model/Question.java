package model;

public class Question {
	
	int	q_cb_id;
	
	
	String	question,ansoption,answer_1,answer_2,answer_3,answer_4,type_ques_n;
	String hint1,hint2,hint3;
	int	q_num_id;
	int q_txt_id;
    double answer;
	int	hint_id;
	double uplimit;
	double lowerlimit;
	public Question() {
		
	}
	
	public int getQ_txt_id() {
		return q_txt_id;
	}
	public void setQ_txt_id(int q_txt_id) {
		this.q_txt_id = q_txt_id;
	}
	
	public int getQ_cb_id() {
		return q_cb_id;
	}
	public Question(int q_cb_id, String question, String ansoption, String answer_1, String answer_2, String answer_3,
			String answer_4, String type_ques_n, String hint1, String hint2, String hint3, int q_num_id, int q_txt_id,
			double answer, int hint_id, double uplimit, double lowerlimit) {
		super();
		this.q_cb_id = q_cb_id;
		this.question = question;
		this.ansoption = ansoption;
		this.answer_1 = answer_1;
		this.answer_2 = answer_2;
		this.answer_3 = answer_3;
		this.answer_4 = answer_4;
		this.type_ques_n = type_ques_n;
		this.hint1 = hint1;
		this.hint2 = hint2;
		this.hint3 = hint3;
		this.q_num_id = q_num_id;
		this.q_txt_id = q_txt_id;
		this.answer = answer;
		this.hint_id = hint_id;
		this.uplimit = uplimit;
		this.lowerlimit = lowerlimit;
	}
	public void setQ_cb_id(int q_cb_id) {
		this.q_cb_id = q_cb_id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnsoption() {
		return ansoption;
	}
	public void setAnsoption(String ansoption) {
		this.ansoption = ansoption;
	}
	public String getAnswer_1() {
		return answer_1;
	}
	public void setAnswer_1(String answer_1) {
		this.answer_1 = answer_1;
	}
	public String getAnswer_2() {
		return answer_2;
	}
	public void setAnswer_2(String answer_2) {
		this.answer_2 = answer_2;
	}
	public String getAnswer_3() {
		return answer_3;
	}
	public void setAnswer_3(String answer_3) {
		this.answer_3 = answer_3;
	}
	public String getAnswer_4() {
		return answer_4;
	}
	public void setAnswer_4(String answer_4) {
		this.answer_4 = answer_4;
	}
	public String getType_ques_n() {
		return type_ques_n;
	}
	public void setType_ques_n(String type_ques_n) {
		this.type_ques_n = type_ques_n;
	}
	public String getHint1() {
		return hint1;
	}
	public void setHint1(String hint1) {
		this.hint1 = hint1;
	}
	public String getHint2() {
		return hint2;
	}
	public void setHint2(String hint2) {
		this.hint2 = hint2;
	}
	public String getHint3() {
		return hint3;
	}
	public void setHint3(String hint3) {
		this.hint3 = hint3;
	}
	public int getQ_num_id() {
		return q_num_id;
	}
	public void setQ_num_id(int q_num_id) {
		this.q_num_id = q_num_id;
	}
	public double getAnswer() {
		return answer;
	}
	public void setAnswer(double answer) {
		this.answer = answer;
	}
	public int getHint_id() {
		return hint_id;
	}
	public void setHint_id(int hint_id) {
		this.hint_id = hint_id;
	}
	public double getUplimit() {
		return uplimit;
	}
	public void setUplimit(double uplimit) {
		this.uplimit = uplimit;
	}
	public double getLowerlimit() {
		return lowerlimit;
	}
	public void setLowerlimit(double lowerlimit) {
		this.lowerlimit = lowerlimit;
	}
	
	
	
	

}
