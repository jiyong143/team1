package kr.kh.team1.service;

import java.util.Date;

public interface PaymentService {
	void addPayment(String orderUid, int paymentPrice, String userId, Date now);

	boolean getPaymentList(String orderUID);
}
