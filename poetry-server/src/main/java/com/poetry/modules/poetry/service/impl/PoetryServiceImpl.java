package com.poetry.modules.poetry.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poetry.modules.poetry.dao.PoetryDao;
import com.poetry.modules.poetry.dao.GoodsPicDao;
import com.poetry.modules.poetry.entity.PoetryEntity;
import com.poetry.modules.poetry.entity.GoodsPicEntity;
import com.poetry.modules.poetry.service.PoetryService;
import com.poetry.modules.member.dao.MemberDao;


@Service("poetryService")
public class PoetryServiceImpl implements PoetryService {
	@Autowired
	private PoetryDao poetryDao;
	@Autowired
	private GoodsPicDao goodsPicDao;
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public PoetryEntity queryObject(Integer id){
		String[] picUrls = goodsPicDao.queryByGoodsId(id);
		PoetryEntity goods = poetryDao.queryObject(id);
		goods.setPicUrls(picUrls);
		return goods;
	}
	
	@Override
	public List<PoetryEntity> queryList(Map<String, Object> map){
		List<PoetryEntity> goodsList = poetryDao.queryList(map);
		return goodsList;
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return poetryDao.queryTotal(map);
	}
	
	@Override
	public void save(PoetryEntity goods){
		poetryDao.save(goods);
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
	public void update(PoetryEntity goods){
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
		poetryDao.update(goods);
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
		poetryDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		poetryDao.deleteBatch(ids);
	}
	

	/**
	 * 可能喜欢
	 * */
	@Override
    public List<PoetryEntity> getLike(Long userId) {
		
        return new ArrayList<PoetryEntity>();
    }
}
