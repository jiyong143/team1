package kr.kh.team1.dao;

import org.apache.ibatis.annotations.Param;

public interface PaymentDAO {

	int selectPayment(@Param("orderUID")String orderUID);

	void insertPayment(@Param("orderUid")String orderUid, @Param("paymentPrice")int paymentPrice, @Param("userId")String userId);

}
