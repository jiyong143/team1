package kr.kh.team1.model.dto;

public class LoginDTO {

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoginDTO {
	private String id;
	private String pw;
}
