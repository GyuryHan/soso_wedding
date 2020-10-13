package kr.co.vo;

import java.util.Date;

public class BoardVO {

   private int bno;
   private String header;
   private String title;
   private String content;
   private String writer;
   private Date regdate;
   private int hit;
   private int reply_cnt;
   public int getBno() {
      return bno;
   }
   public void setBno(int bno) {
      this.bno = bno;
   }
   public String getHeader() {
      return header;
   }
   public void setHeader(String header) {
      this.header = header;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public int getReply_cnt() {
      return reply_cnt;
   }
   public void setReply_cnt(int reply_cnt) {
      this.reply_cnt = reply_cnt;
   }
   @Override
   public String toString() {
      return "BoardVO [bno=" + bno + ", header=" + header + ", title=" + title + ", content=" + content + ", writer="
            + writer + ", regdate=" + regdate + ", hit=" + hit + ", reply_cnt=" + reply_cnt + "]";
   }
   
   
   
}