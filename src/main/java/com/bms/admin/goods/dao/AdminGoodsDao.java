
package com.bms.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;

import com.bms.common.page.PageInfo;
import com.bms.goods.dto.GoodsDto;
import com.bms.goods.dto.ImageFileDto;

public interface AdminGoodsDao {
	
	public void insertNewGoods(Map<String,Object> newGoodsMap) throws DataAccessException;
	public int selectMaxGoodsId() throws DataAccessException;
	
	int selectListCount(SqlSessionTemplate sqlSession);
	public List<GoodsDto>selectNewGoodsList(SqlSessionTemplate sqlSession, Map<String, Object> condMap, PageInfo pi) throws DataAccessException;
	
	public Map<String,Object> selectGoodsDetail(int goodsId) throws DataAccessException;
	public List<ImageFileDto> selectGoodsImageFileList(int goodsId) throws DataAccessException;
	public void insertGoodsImageFile(List<ImageFileDto> fileList)  throws DataAccessException;
	public void updateGoodsInfo(Map<String,String> goodsMap) throws DataAccessException;
	public void updateGoodsImage(List<ImageFileDto> imageFileList) throws DataAccessException;
	public void deleteGoodsImage(int image_id) throws DataAccessException;

	
}
