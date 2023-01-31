package jdbc;

public class FeedDTO {
	private int no;
	private String id;
	private String content;
	private String ts;
	public FeedDTO(int no, String id, String content, String ts) {
		super();
		this.no = no;
		this.id = id;
		this.content = content;
		this.ts = ts;
	}
	public FeedDTO() {
		super();
	}
	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public String getContent() {
		return content;
	}
	public String getTs() {
		return ts;
	}
	
	
	
}
