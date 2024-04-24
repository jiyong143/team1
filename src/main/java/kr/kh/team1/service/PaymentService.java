package kr.kh.team1.service;

public interface PaymentService {
	void addPayment(String orderUid, int paymentPrice, String userId);

	boolean getPaymentList(String orderUID);
}
