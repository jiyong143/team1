package kr.kh.team1.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
    public static String uploadFile(String uploadPath, String originalName, byte[]
            fileData)throws Exception{
    	
        UUID uid = UUID.randomUUID(); // 랜덤한 UUID 생성 : 같은 파일명을 처리히기 위해서
        String savedName = uid.toString() +"_" + originalName; // 파일명에 UUID를 붙임
        String savedPath = calcPath(uploadPath);  // 파일을 저장할 경로
        File target = new File(uploadPath + savedPath, savedName); // 서버에 업로드할 파일 객체 생성
        FileCopyUtils.copy(fileData, target); // 파일을 서버에 업로드
        String uploadFileName = getFileName(savedPath, savedName); // 업로드된 파일의 파일명을 가져옴
        return uploadFileName; 
    }

    private static String calcPath(String uploadPath) {
        Calendar cal = Calendar.getInstance();
        String yearPath = File.separator+cal.get(Calendar.YEAR);
        String monthPath = yearPath + File.separator
            + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
        String datePath = monthPath + File.separator
            + new DecimalFormat("00").format(cal.get(Calendar.DATE));
        makeDir(uploadPath, yearPath, monthPath, datePath);
        return datePath;

    }
    private static void makeDir(String uploadPath, String... paths) {
        if(new File(paths[paths.length-1]).exists())
            return;
        for(String path : paths) {
            File dirPath = new File(uploadPath + path);
            if( !dirPath.exists())
                dirPath.mkdir();
        }
    }
    private static String getFileName(String path, String fileName)
            throws Exception{
        String iconName = path + File.separator + fileName;
        return iconName.replace(File.separatorChar, '/');
    }
    
    public static void deleteFile(String uploadPath, String fi_name) {
		fi_name = fi_name.replace('/', File.separatorChar);	// / => \ 로 변경
		File file = new File(uploadPath + fi_name);
		
		// 파일이 존재하면 파일을 삭제
		if(file.exists()) {
			file.delete();	// 삭제해주는 메서드 (툴에서 제공)
		}
	}
}