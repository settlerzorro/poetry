package com.poetry.modules.goods.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poetry.modules.goods.dao.GoodsDao;
import com.poetry.modules.goods.dao.GoodsPicDao;
import com.poetry.modules.goods.dao.HistoryDao;
import com.poetry.modules.goods.entity.GoodsEntity;
import com.poetry.modules.goods.entity.GoodsPicEntity;
import com.poetry.modules.goods.service.GoodsService;
import com.poetry.modules.member.dao.MemberDao;


@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private GoodsPicDao goodsPicDao;
	@Autowired
	private HistoryDao historyDao;
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public GoodsEntity queryObject(Integer id){
		String[] picUrls = goodsPicDao.queryByGoodsId(id);
		GoodsEntity goods = goodsDao.queryObject(id);
		goods.setPicUrls(picUrls);
		return goods;
	}
	
	@Override
	public List<GoodsEntity> queryList(Map<String, Object> map){
		List<GoodsEntity> goodsList = goodsDao.queryList(map);
		return goodsList;
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return goodsDao.queryTotal(map);
	}
	
	@Override
	public void save(GoodsEntity goods){
		goodsDao.save(goods);
		if (goods.getPicUrls() != null) {
			String[] picUrls = goods.getPicUrls();
			for (String picUrl : picUrls) {
				GoodsPicEntity goodsPic = new GoodsPicEntity();
				goodsPic.setGoodsId(goods.getId());
				goodsPic.setPicUrl(picUrl);
				goodsPicDao.save(goodsPic);
			}
		}
	}
	
	@Override
	public void update(GoodsEntity goods){
		if (goods.getPicUrls() != null) {
			String[] picUrls = goodsPicDao.queryByGoodsId(goods.getId());
			boolean e = isQualsPic(picUrls, goods.getPicUrls());
			if (!e) {
				goodsPicDao.deleteByGoodsId(goods.getId());
				for (String picUrl : goods.getPicUrls()) {
					GoodsPicEntity goodsPic = new GoodsPicEntity();
					goodsPic.setGoodsId(goods.getId());
					goodsPic.setPicUrl(picUrl);
					goodsPicDao.save(goodsPic);
				}
			}
		}
		goodsDao.update(goods);
	}
	
	private boolean isQualsPic(String[] picUrls, String[] picUrls2) {
		if (picUrls.length == picUrls2.length) {
			for (int i = 0; i < picUrls.length; i++) {
				if (!picUrls[i].equals(picUrls2[i])) {
					return false;
				}
			}
			return true;
		}
		return false;
	}
	
	@Override
	public void delete(Integer id){
		goodsDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		goodsDao.deleteBatch(ids);
	}
	
	@Override
	public void updateStatus(Integer status, Integer[] ids) {
		goodsDao.updateStatus(status, ids);
	}
	
	/**
	 * 可能喜欢
	 * */
	@Override
    public List<GoodsEntity> getLike(Long userId) {
		
        return new ArrayList<GoodsEntity>();
    }
}
