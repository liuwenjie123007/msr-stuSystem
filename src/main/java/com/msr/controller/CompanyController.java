package com.msr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.msr.entity.Company;
import com.msr.page.Page;
import com.msr.service.CompanyService;
import com.msr.util.ExcelUtiles;

@RequestMapping("/admin/company")
@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	/**
	 * 企业列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("company/list");
		return model;
	}
	/**
	 * 获取企业列表
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(Page page,Company company){
		//定义map集合，封装数据，传递给前端页面
		Map<String, Object> ret = new HashMap<String, Object>();
		
		//查询企业信息
		List<Company> companyList = companyService.companyList(page,company);
		
		//往map中添加元素
		ret.put("rows", companyList);
		ret.put("total", companyService.getTotal(page,company));
		return ret;
	}
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Company company){
		Map<String, String> ret = new HashMap<String, String>();
		if(company == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的企业信息！");
			return ret;
		}
		if(companyService.add(company) <= 0){
			ret.put("type", "error");
			ret.put("msg", "企业添加失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	/**
	 * 编辑企业 
	 * @param company
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Company company){
		Map<String, String> ret = new HashMap<String, String>();
		if(company == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的企业信息！");
			return ret;
		}
		if(companyService.edit(company) <= 0){
			ret.put("type", "error");
			ret.put("msg", "企业修改失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "企业修改成功！");
		return ret;
	}
	
	/**
	 * 批量删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(String ids){
		Map<String, String> ret = new HashMap<String, String>();
		if(StringUtils.isEmpty(ids)){
			ret.put("type", "error");
			ret.put("msg", "选择要删除的数据！");
			return ret;
		}
		if(ids.contains(",")){
			ids = ids.substring(0,ids.length()-1);
		}
		if(companyService.delete(ids) <= 0){
			ret.put("type", "error");
			ret.put("msg", "企业删除失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "用户删除成功！");
		return ret;
	}
	/**
	 * 获取"企业名称"下拉列表数据
	 */
	@RequestMapping(value="/getCompanyNameList",method=RequestMethod.POST)
	@ResponseBody
	public List<Company> getCompanyNameList(){
		return companyService.getCompanyNameList();
	}
	
	// Excel导入
	@RequestMapping("importExcel")
	public String importExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
		List<Company> personList = ExcelUtiles.importExcel(file, 0, 1, Company.class);
		for (Company company : personList) {
			//System.out.println(company.getCompanyId()+"\t"+company.getCompanyName()+"\t"+company.getCompanyTel());
			companyService.add(company);
		}
		return "redirect:list";
		 //设置导入的参数
		/*ImportParams params = new ImportParams();
		//去掉第一行表头
		params.setHeadRows(1);
		ExcelImportResult<Company> result = ExcelImportUtil.importExcelMore(file.getInputStream(), Company.class, params);
		
		List<Company> list = result.getList();
		for (Company company : list) {
			System.out.println(company.getCompanyId()+"\t"+company.getCompanyName()+"\t"+company.getCompanyTel());
		}*/
		// TODO 保存数据库
	}
}
