package com.tnt.jsons;

import javax.persistence.Entity;

@Entity
public class Trans {

	private String code;
	private float rate;
	private String mode;
	private float amount;
	
	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Trans(){}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}

	@Override
	public String toString() {
		return "Trans [code=" + code + ", rate=" + rate + ", mode=" + mode + ", amount=" + amount + "]";
	}
	
	
	
	
}
