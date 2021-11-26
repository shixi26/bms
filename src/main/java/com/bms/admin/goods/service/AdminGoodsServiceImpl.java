package com.bms.admin.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bms.admin.goods.dao.AdminGoodsDao;
import com.bms.common.page.PageInfo;
import com.bms.goods.dto.GoodsDto;
import com.bms.goods.dto.ImageFileDto;


@Service
@Transactional(propagation=Propagation.REQUIRED)
public class AdminGoodsServiceImpl implements AdminGoodsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminGoodsDao adminGoodsDao;
	
	@Override
	public int addNewGoods(Map<String,Object> newGoodsMap) throws Exception{
		
		adminGoodsDao.insertNewGoods(newGoodsMap);
		ArrayList<ImageFileDto> imageFileList = (ArrayList)newGoodsMap.get("imageFileList");
		
		int goodsId = adminGoodsDao.selectMaxGoodsId();
		
		for (ImageFileDto imageFileDto : imageFileList) {
			imageFileDto.setGoodsId(goodsId);
		}
		
		adminGoodsDao.insertGoodsImageFile(imageFileList);
		
		return goodsId;
		
	}
	
	//BOARD
	public int selectListCount() throws Exception {
		return adminGoodsDao.selectListCount(sqlSession);
	}
	@Override
	public List<GoodsDto> listNewGoods(Map<String,Object> condMap, PageInfo pi) throws Exception{
		return adminGoodsDao.selectNewGoodsList(sqlSession, condMap, pi);
	}
	
//	public List<GoodsDto> listNewGoods(Map<String, Object> condMap) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	
	@Override
	public Map<String,Object> goodsDetail(int goodsId) throws Exception {
		
		Map<String,Object> goodsMap = new HashMap<String,Object>();
		
		goodsMap.put("goods", adminGoodsDao.selectGoodsDetail(goodsId));
		goodsMap.put("imageFileList", adminGoodsDao.selectGoodsImageFileList(goodsId));
		
		return goodsMap;
		
	}
	
	
	@Override
	public List<ImageFileDto> goodsImageFile(int goodsId) throws Exception{
		return adminGoodsDao.selectGoodsImageFileList(goodsId);
	}
	
	
	@Override
	public void modifyGoodsInfo(Map<String,String> goodsMap) throws Exception{
		adminGoodsDao.updateGoodsInfo(goodsMap);
		
	}	
	
	
	@Override
	public void modifyGoodsImage(List<ImageFileDto> imageFileList) throws Exception{
		adminGoodsDao.updateGoodsImage(imageFileList); 
	}
	
	
	@Override
	public void removeGoodsImage(int image_id) throws Exception{
		adminGoodsDao.deleteGoodsImage(image_id);
	}
	
	
	@Override
	public void addNewGoodsImage(List<ImageFileDto> imageFileList) throws Exception{
		adminGoodsDao.insertGoodsImageFile(imageFileList);
	}

	
}
