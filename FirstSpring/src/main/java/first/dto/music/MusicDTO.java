package first.dto.music;

public class MusicDTO {
	private Integer music_num;
	private String header;
	private String music_title;
	private String music_uploader;
	private int music_readcnt;
	private String date;
	
	public Integer getMusic_num() {
		return music_num;
	}
	public void setMusic_num(Integer music_num) {
		this.music_num = music_num;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getMusic_title() {
		return music_title;
	}
	public void setMusic_title(String music_title) {
		this.music_title = music_title;
	}
	public String getMusic_uploader() {
		return music_uploader;
	}
	public void setMusic_uploader(String music_uploader) {
		this.music_uploader = music_uploader;
	}
	public int getMusic_readcnt() {
		return music_readcnt;
	}
	public void setMusic_readcnt(int music_readcnt) {
		this.music_readcnt = music_readcnt;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

	
}
