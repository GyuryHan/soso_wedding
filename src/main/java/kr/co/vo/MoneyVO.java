package kr.co.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MoneyVO {
	
	private int money;
	@JsonFormat(pattern = "yyyy-MM-dd",shape = JsonFormat.Shape.STRING)
	private Date orderdate;
	

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}



	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "MoneyVO [money=" + money + ", orderdate=" + orderdate + "]";
	}
	
	

}
