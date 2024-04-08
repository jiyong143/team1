package kr.kh.team1.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.TopGroupDAO;


@Service
public class TopGroupServiceImp implements TopGroupService {
	
   @Autowired
	TopGroupDAO  topGroupDao;


}
