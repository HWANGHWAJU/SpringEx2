package first.dto.scraps;

public class ScrapDTO {
	private Integer scrap_num;
	private String scrap_user;
	private String scrap_board;
	private int scrap_article_num;
	private String title;
	private String date;
	private String header;
	
	public void setScrap_num(Integer scrap_num) {
		this.scrap_num = scrap_num;
	}
	public void setScrap_user(String scrap_user) {
		this.scrap_user = scrap_user;
	}
	public void setScrap_board(String scrap_board) {
		this.scrap_board = scrap_board;
	}
	public void setScrap_article_num(int scrap_article_num) {
		this.scrap_article_num = scrap_article_num;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public void setDate(String date){
		this.date = date;
	}
	public void setHeader(String header){
		this.header = header;
	}
	public Integer getScrap_num() {
		return scrap_num;
	}
	public String getScrap_user() {
		return scrap_user;
	}
	public String getScrap_board() {
		return scrap_board;
	}
	public int getScrap_article_num() {
		return scrap_article_num;
	}
	public String getTitle(){
		return title;
	}
	public String getDate(){
		return date;
	}
	public String getHeader(){
		return header;
	}
}
