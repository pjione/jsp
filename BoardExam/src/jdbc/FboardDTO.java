package jdbc;

public class FboardDTO {
	private String bno;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String bfile;
	private String bfile2;
	private String bdate;
	
	public FboardDTO(String bno, String btitle, String bwriter, String bcontent, String bfile, String bfile2, String bdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bcontent = bcontent;
		this.bfile = bfile;
		this.bfile2 = bfile2;
		this.bdate = bdate;
	}
	public String getBno() {
		return bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBwriter() {
		return bwriter;
	}
	public String getBcontent() {
		return bcontent;
	}	
	public String getBfile() {
		return bfile;
	}	
	public String getBfile2() {
		return bfile2;
	}
	public String getBdate() {
		return bdate;
	}
	
	
	
}
