package kr.kh.team1.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.team1.dao.PaymentDAO;

@Service
public class PaymentServiceImp implements PaymentService {
	
	@Autowired
	PaymentDAO paymentDao;
	
	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}
	
	@Override
	public void addPayment(String orderUid, int paymentPrice, String userId, Date now) {
		if(checkString(orderUid) &&
		   checkString(userId)) {
			paymentDao.insertPayment(orderUid, paymentPrice, userId, now);
		}
		
	}

	@Override
	public boolean getPaymentList(String orderUID) {
		int res = paymentDao.selectPayment(orderUID);
		if(res==0) {
			return true;
		}
		return false;
	}
}
