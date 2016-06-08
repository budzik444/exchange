package com.tnt.dao;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	
	private float PLN = 0;
	private float USD = 0;
	private float EUR = 0;
	private float CHF = 0;
	private float RUB = 0;
	private float CZK = 0;
	private float GBP = 0;
	@Id
	private String username;
	private String authority = "ROLE_USER";
	private String password;
	
		
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





	public String getUsername() {
		return username;
	}





	public void setUsername(String username) {
		this.username = username;
	}





	public String getAuthority() {
		return authority;
	}





	public void setAuthority(String authority) {
		this.authority = authority;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}





	@Override
	public String toString() {
		return "User [PLN=" + PLN + ", USD=" + USD + ", EUR=" + EUR + ", CHF=" + CHF + ", RUB=" + RUB + ", CZK=" + CZK
				+ ", GBP=" + GBP + ", username=" + username + ", authority=" + authority + ", password=" + password
				+ "]";
	}
	
	

}
