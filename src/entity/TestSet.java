package entity;

public class TestSet {
	private String course = "";
	private int judgeCnt = 0;
	private int judgeScore = 0;
	private int singleCnt = 0;
	private int singleScore = 0;
	private int mulCnt = 0;
	private int mulScore = 0;
	private int totalTime = 0;
	private String testTime = "";

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public int getJudgeCnt() {
		return judgeCnt;
	}

	public void setJudgeCnt(int judgeCnt) {
		this.judgeCnt = judgeCnt;
	}

	public int getJudgeScore() {
		return judgeScore;
	}

	public void setJudgeScore(int judgeScore) {
		this.judgeScore = judgeScore;
	}

	public int getSingleCnt() {
		return singleCnt;
	}

	public void setSingleCnt(int singleCnt) {
		this.singleCnt = singleCnt;
	}

	public int getSingleScore() {
		return singleScore;
	}

	public void setSingleScore(int singleScore) {
		this.singleScore = singleScore;
	}

	public int getMulCnt() {
		return mulCnt;
	}

	public void setMulCnt(int mulCnt) {
		this.mulCnt = mulCnt;
	}

	public int getMulScore() {
		return mulScore;
	}

	public void setMulScore(int mulScore) {
		this.mulScore = mulScore;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}
	
	@Override
	public String toString() {
		return "Test[course=" + course + ", time=" + testTime + "]" + 
				"judegCnt:" + judgeCnt + ", SinCnt:" + singleCnt + ", mulCnt:" + mulCnt;
	}
}
