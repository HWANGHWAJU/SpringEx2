package first.common.dao;

import java.util.*;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.codehaus.plexus.util.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
    protected Log log = LogFactory.getLog(AbstractDAO.class);
     
    //context-mapper에서 SqlSessionTemplate이 sqlSession 을 대체한다고 선언. /
    //어노테이션 Autowired을 통해 xml에 선언했던 의존 관계를 자동으로 주입함. 
    @Autowired
    private SqlSessionTemplate sqlSession;
     
    //페이징 처리하는 로직
   //JsonView
    
    @SuppressWarnings("unchecked")
    public Object selectPagingList(String queryId, Object params){
        printQueryId(queryId);
        Map<String,Object> map = (Map<String,Object>)params;
         
        String strPageIndex = (String)map.get("PAGE_INDEX");
        String strPageRow = (String)map.get("PAGE_ROW");
        int nPageIndex = 0;
        int nPageRow = 15;
         
        if(StringUtils.isEmpty(strPageIndex) == false){
            nPageIndex = Integer.parseInt(strPageIndex)-1;
        }
        if(StringUtils.isEmpty(strPageRow) == false){
            nPageRow = Integer.parseInt(strPageRow);
        }
        map.put("START", (nPageIndex * nPageRow) + 1);
        map.put("END", 15);
         
        return sqlSession.selectList(queryId, map);
    }


    protected void printQueryId(String queryId) {
        if(log.isDebugEnabled()){
            log.debug("\t QueryId  \t:  " + queryId);
        }
    }
     
    public Object insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
     
    public Object update(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.update(queryId, params);
    }
     
    public Object delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }
     
    public Object selectOne(String queryId){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId);
    }
     
    public Object selectOne(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, params);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
        printQueryId(queryId);
        return sqlSession.selectList(queryId);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }
}
