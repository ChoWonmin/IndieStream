package spring.indiestream.domain;

public class SoundSearchVO {
	private String soundGenre;
	private String keyword;
	public String getSoundGenre() {
		return soundGenre;
	}
	public void setSoundGenre(String soundGenre) {
		this.soundGenre = soundGenre;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public SoundSearchVO(String soundGenre, String keyword) {
		super();
		this.soundGenre = soundGenre;
		this.keyword = keyword;
	}
	public SoundSearchVO() {
		super();
	}
	
	
}
