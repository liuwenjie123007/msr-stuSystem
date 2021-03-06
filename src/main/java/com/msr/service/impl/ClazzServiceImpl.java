package com.msr.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msr.entity.Clazz;
import com.msr.entity.ClazzExample;
import com.msr.entity.ClazzExample.Criteria;
import com.msr.mapper.ClazzMapper;
import com.msr.page.Page;
import com.msr.service.ClazzService;
import com.msr.util.DateUtil;
import com.msr.util.PojoUtils;
import com.msr.util.StringUtil;

@Service
public class ClazzServiceImpl implements ClazzService{
	@Autowired
	private ClazzMapper clazzMapper;
	/**
	 * 设置条件查询参数
	 * @param page
	 * @param clazz
	 * @return
	 */
	public ClazzExample queryClazzExample(Page page,Clazz clazz) {
		//设置 条件查询
		ClazzExample clazzExample = new ClazzExample();
		
		Criteria criteria = clazzExample.createCriteria();
		
		//如果对象不为空，则进行条件查询
		if(clazz!=null) {
			if(!StringUtil.isEmpty(clazz.getClazzName()))
				criteria.andClazzNameEqualTo(clazz.getClazzName());
			
			if(clazz.getTeacherId()!=null)
				criteria.andTeacherIdEqualTo(clazz.getTeacherId());
		}
		
		//设置排序字段
		clazzExample.setOrderByClause("clazz_startTime DESC");//注意：排序使用的是sql中的列名
		//设置分页参数    
		clazzExample.setStartRow(page.getOffset()); 
		clazzExample.setPageSize(page.getRows());
		
		return clazzExample;
	}
	
	/**
	 * 获取班级列表
	 */
	@Override
	public List<Clazz> clazzList(Page page, Clazz clazz) {
		ClazzExample clazzExample = queryClazzExample(page, clazz);
		
		List<Clazz> clzssList = clazzMapper.selectByExample(clazzExample);
		
		for (Clazz c : clzssList) {
			edit(c);
		}
		
		return clzssList;
	}


	/**
	 * 获取总记录数
	 * @param queryMap
	 * @return
	 */
	@Override
	public int getTotal(Page page,Clazz clazz) {
		ClazzExample clazzExample = queryClazzExample(page, clazz);
		return clazzMapper.countByExample(clazzExample);
	}

	
	/**
	 * 获取指定列的集合(clazzId,clazzName)两列
	 */
	@Override
	public List<Clazz> getClazzNameList() {
		try {
			//获取所有段的数据集合
			List<Clazz> listAll = clazzMapper.selectByExample(null);
			//获取指定字段的数据集合
			return (List<Clazz>)PojoUtils.convertToPojoByAddAttr(listAll,"clazzId,clazzName");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	/**
	 * 添加企业信息
	 */
	@Override
	public int add(Clazz clazz) {
		//添加时，设置默认状态为“1”，授课中
		clazz.setClazzStatus(1);
		return clazzMapper.insert(clazz);
	}

	/**
	 * 修改企业信息
	 * @param clazz
	 * @return
	 */
	@Override
	public int edit(Clazz clazz) {
		// TODO Auto-generated method stub
		//比较两日期大小。如果date>otherDate则返回true,否则false
		if(DateUtil.whenGT(clazz.getClazzEndtime(),new Date())) {
			clazz.setClazzStatus(1);
		}else {
			clazz.setClazzStatus(2);
		}
		
		
		return clazzMapper.updateByPrimaryKey(clazz);
	}

	/**
	 * 删除企业信息
	 */
	@Override
	public int delete(String ids) {
		if(ids.contains(",")){
			ids = ids.substring(0,ids.length()-1);
		}
		return clazzMapper.delete(ids);
	}

	@Override
	public Clazz findClazzById(Integer cid) {
		// TODO Auto-generated method stub
		return clazzMapper.selectByPrimaryKey(cid);
	}

}
