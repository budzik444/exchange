package com.tnt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tnt.dao.BankBalance;
import com.tnt.dao.BankDao;
import com.tnt.dao.User;
import com.tnt.dao.UserDao;
import com.tnt.jsons.Trans;

@Service("bankService")
public class BankService {

	private BankDao bankDao;
	private UserDao userDao;
	
	
	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Autowired
	public void setBankDao(BankDao bankDao) {
		this.bankDao = bankDao;
	}

	public BankBalance getCurrentBalance() {
		List<BankBalance> list = bankDao.getBalances();

		return list.get(list.size() - 1);

	}

	public void makeTransaction(Trans trans, String username, User user, BankBalance bank) {

		String mode = trans.getMode();

		String code = trans.getCode();

		float rate = trans.getRate();
		
		float amount = trans.getAmount();
		
		float value = rate * amount;
		

		if (code == "RUB" || code == "CZK") {
			rate /= 100;
			amount *= 100;
		}
		System.out.println("fom service:" + trans);
		if (mode.equals("buy"))
		{
			value = -value;
			amount = -amount;
		}
			
		user.setPLN(user.getPLN() + value);
		bank.setPLN(bank.getPLN() - value);
		 	 
		if (code.equals("USD")) {System.out.println(code);user.setUSD(user.getUSD() - amount); bank.setUSD(bank.getUSD() + amount);}
		else if (code.equals("EUR")){ user.setEUR(user.getEUR() - amount); bank.setEUR(bank.getEUR() + amount);}
		else if (code.equals("CHF")){ user.setCHF(user.getCHF() - amount); bank.setCHF(user.getCHF() + amount);}
		else if (code.equals("RUB")){ user.setRUB(user.getRUB() - amount); bank.setRUB(user.getRUB() + amount);}
		else if (code.equals("CZK")){ user.setCZK(user.getCZK() - amount); bank.setCZK(user.getCZK() + amount);}
		else if (code.equals("GBP")){ user.setGBP(user.getGBP() - amount); bank.setGBP(user.getGBP() + amount);}
			
		userDao.update(user);
		bankDao.update(bank);
		
		

	}

}
