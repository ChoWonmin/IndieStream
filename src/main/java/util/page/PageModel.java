package util.page;

public class PageModel {
	private String key;
	private int page;
	private int contetnNumber;
	
	public PageModel() {
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getContetnNumber() {
		return contetnNumber;
	}
	public void setContetnNumber(int contetnNumber) {
		this.contetnNumber = contetnNumber;
	}
	
}
