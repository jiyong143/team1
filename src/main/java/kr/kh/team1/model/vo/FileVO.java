package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
	private int fi_num; 
	private String fi_ori_name; 
	private String fi_name; 
	private int fi_pr_num;
	
	static final String [] imgExtensions = 
		{".jpg", ".JPG", ".png", ".PNG", ".bmp", ".BMP", ".gif", ".GIF"};
	
	public FileVO(int fi_pr_num, String fi_ori_name, String fi_name) {
		this.fi_pr_num = fi_pr_num;
		this.fi_ori_name = fi_ori_name;
		this.fi_name = fi_name;
	}
	
	public boolean isImg() {
		if(fi_ori_name == null) 
			return false;
		for(String imgExtension : imgExtensions) {
			if(fi_ori_name.endsWith(imgExtension)) {
				return true;
			}
		}
		return false;
	}
}