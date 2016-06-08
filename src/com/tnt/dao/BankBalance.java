package com.tnt.dao;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bank_balance")
public class BankBalance {
	
	private float PLN;
	private float USD;
	private float EUR;
	private float CHF;
	private float RUB;
	private float CZK;
	private float GBP;
	@Id
	private int id;
		
	
	public BankBalance(float pLN, float uSD, float eUR, float cHF, float rUB, float cZK, float gBP, int id) {
		
		PLN = pLN;
		USD = uSD;
		EUR = eUR;
		CHF = cHF;
		RUB = rUB;
		CZK = cZK;
		GBP = gBP;
		this.id = id;
	}
	
	public BankBalance(){}

	public float getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	public float getPLN() {
		return PLN;
	}
	public void setPLN(float pLN) {
		PLN = pLN;
	}
	public float getUSD() {
		return USD;
	}
	public void setUSD(float uSD) {
		USD = uSD;
	}
	public float getEUR() {
		return EUR;
	}
	public void setEUR(float eUR) {
		EUR = eUR;
	}
	public float getCHF() {
		return CHF;
	}
	public void setCHF(float cHF) {
		CHF = cHF;
	}
	public float getRUB() {
		return RUB;
	}
	public void setRUB(float rUB) {
		RUB = rUB;
	}
	public float getCZK() {
		return CZK;
	}
	public void setCZK(float cZK) {
		CZK = cZK;
	}
	public float getGBP() {
		return GBP;
	}
	public void setGBP(float gBP) {
		GBP = gBP;
	}
	@Override
	public String toString() {
		return "BankBalance [PLN=" + PLN + ", USD=" + USD + ", EUR=" + EUR + ", CHF=" + CHF + ", RUB=" + RUB + ", CZK="
				+ CZK + ", GBP=" + GBP + "]";
	}
	
	
	

}
