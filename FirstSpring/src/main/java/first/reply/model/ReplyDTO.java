package first.reply.model;

public class ReplyDTO {
	private String board_name;
	private int reply_name;
	private int item_name;
	private String text;
	private String date;
	private String writer_id;
	
	public String getBoard_name() {
		return board_name;
	}
	public int getReply_name() {
		return reply_name;
	}
	public int getItem_name() {
		return item_name;
	}
	public String getText() {
		return text;
	}
	public String getDate() {
		return date;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public void setReply_name(int reply_name) {
		this.reply_name = reply_name;
	}
	public void setItem_name(int item_name) {
		this.item_name = item_name;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	
	
}
