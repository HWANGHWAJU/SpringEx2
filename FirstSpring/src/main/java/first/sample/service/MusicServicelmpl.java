package first.sample.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.common.CommandMap;
import first.dto.file.FileDTO;
import first.dto.music.MusicDTO;
import first.dto.practice.PracDTO;
import first.dto.scraps.ScrapDTO;
import first.sample.dao.MusicDAO;
import first.common.util.FileUtils;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("musicService")
public class MusicServicelmpl implements MusicService{
	Logger log = Logger.getLogger(this.getClass());
	
	//	공통 변수 
	@Resource(name="musicDAO") //이런 어노테이션이 존나 중요 
	private MusicDAO musicDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	

	public List<Map<String, Object>> selectMusicBoardList(Map<String, Object> commandMap) throws Exception{
		
		System.out.println("============================>MusicServiceImpl");
		return musicDAO.selectMusicBoardList(commandMap);
	}

	public Map<String, Object> selectMusicBoardDetail(Map<String, Object> map) throws Exception{
		
		//글의 큰 정보
		Map<String, Object> tempMap = musicDAO.selectMusicBoardDetail(map); 
		//글의 내용 정보
		Map<String, Object> content = musicDAO.selectMusicContent(map);	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<FileDTO> files = musicDAO.selectFileLIst(map);

		System.out.println("content 내용 ");
		
		resultMap.put("music", tempMap);
		resultMap.put("music_content", content);
		resultMap.put("files", files);
		
		
		return resultMap;
	}
	
	public List<MusicDTO> selectMusicIwritten(CommandMap map) throws Exception{
	
		List<MusicDTO> musicList = musicDAO.selectMusicIwritten(map);
		return musicList;
	}
	
	public List<ScrapDTO> selectMusicScraps(CommandMap map) throws Exception{
		List<ScrapDTO> musicScrap = musicDAO.selectScraps(map);
		return musicScrap;
	}
	
	public void insertMusic(Map<String, Object> map, HttpServletRequest request) throws Exception{
		musicDAO.insertMusic(map);
		musicDAO.insertMusicContent(map);
		
		List<Map<String, Object>> files = fileUtils.parseInsertFileInfo(map, request);
		System.out.println("파일 개수 ;"+files.size());
		for(int i=0, size=files.size(); i<size; i++){
			
			musicDAO.insertFile(files.get(i));
		}
	}
	
	public void deleteArticle(Map<String, Object> map) throws Exception{
		musicDAO.deleteArticle(map);
		musicDAO.deleteContent(map);
		musicDAO.deleteFile(map);
	}
	
	public List<PracDTO> selectPracMap(Map<String, Object> map) throws Exception{
		List<PracDTO> listP = musicDAO.selectPrac(map);
		return listP;
	}
	

	@Override
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		musicDAO.updateHitCnt(map);
	}
}
