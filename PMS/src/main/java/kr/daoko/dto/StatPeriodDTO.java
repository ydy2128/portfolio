package kr.daoko.dto;

import java.util.Date;

public class StatPeriodDTO {
	private String period;
	private String ssn;
	private int car_in;
	private int car_out;
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getCar_in() {
		return car_in;
	}
	public void setCar_in(int car_in) {
		this.car_in = car_in;
	}
	public int getCar_out() {
		return car_out;
	}
	public void setCar_out(int car_out) {
		this.car_out = car_out;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	
}
