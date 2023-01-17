package jdbc;

public class MemberDTO {
	private String mbno;
	private String mname;
	private String mid;
	private String mpass;
	private String mgender;
	private String meamil;
	private String mdate;
	
	public MemberDTO(String mbno, String mname, String mid, String mpass, String mgender, String meamil, String mdate) {
		super();
		this.mbno = mbno;
		this.mname = mname;
		this.mid = mid;
		this.mpass = mpass;
		this.mgender = mgender;
		this.meamil = meamil;
		this.mdate = mdate;
	}
	public String getMbno() {
		return mbno;
	}
	public String getMname() {
		return mname;
	}
	public String getMid() {
		return mid;
	}
	public String getMpass() {
		return mpass;
	}
	public String getMgender() {
		return mgender;
	}
	public String getMeamil() {
		return meamil;
	}
	public String getMdate() {
		return mdate;
	}
	
	
}
