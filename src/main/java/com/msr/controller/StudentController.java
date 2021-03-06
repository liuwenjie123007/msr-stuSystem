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

import com.msr.entity.Role;
import com.msr.entity.Student;
import com.msr.entity.Teacher;
import com.msr.entity.User;
import com.msr.page.Page;
import com.msr.service.StudentService;
import com.msr.service.TeacherService;
import com.msr.util.ExcelUtiles;

@RequestMapping("/admin/student")
@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	/**
	 * 学生列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("student/list");
		return model;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(HttpServletRequest request,Page page,Student student){
		//定义map集合，封装数据，传递给前端页面
		Map<String, Object> ret = new HashMap<String, Object>();
		Role role = (Role)request.getSession().getAttribute("role");
		User user =(User)request.getSession().getAttribute("admin");
		
		if(role.getId() == 3) {
			student.setStuName(user.getUsername());
		}else if(role.getId() == 2) {
			List<Teacher> teacherNameList = teacherService.getTeacherNameList();
			for (Teacher teacher : teacherNameList) {
				if(teacher.getTeacherName().equals(user.getUsername())) {
					student.setTeacherId(teacher.getTeacherId());
					student.setStuStatus(1);
					break;
				}
			}
		}
		//查询学生信息
		List<Student> studentList = studentService.studentList(page,student);
		
		//往map中添加元素
		ret.put("rows", studentList);
		ret.put("total", studentService.getTotal(page,student));
		return ret;
	}
	
	/**
	 * 添加学生
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Student student){
		Map<String, String> ret = new HashMap<String, String>();
		if(student == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的学生信息！");
			return ret;
		}
		if(studentService.add(student) <= 0){
			ret.put("type", "error");
			ret.put("msg", "学生添加失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		return ret;
	}
	
	/**
	 * 编辑学生 
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Student student){
		Map<String, String> ret = new HashMap<String, String>();
		if(student == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的学生信息！");
			return ret;
		}
		if(studentService.edit(student) <= 0){
			ret.put("type", "error");
			ret.put("msg", "学生修改失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "学生修改成功！");
		return ret;
	}
	
	/**
	 * 批量删除学生
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
		if(studentService.delete(ids) <= 0){
			ret.put("type", "error");
			ret.put("msg", "学生删除失败，请联系管理员！");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "学生删除成功！");
		return ret;
	}
	
	/**
	 * 获取"学生名称"下拉列表数据
	 */
	@RequestMapping(value="/getStudentNameList",method=RequestMethod.POST)
	@ResponseBody
	public List<Student> getStudentNameList(String type,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("admin");
		List<Teacher> teacherList = teacherService.getTeacherNameList();
		
		int teacherId = -1;
		for (Teacher teacher : teacherList) {
			if(teacher.getTeacherName().equals(user.getUsername())) {
				teacherId = teacher.getTeacherId();
				break;
			}
		}
		
		System.out.println("teacherId:"+teacherId);
		
		return studentService.getStudentNameList(type,teacherId);
	}
	
	// Excel导入
	@RequestMapping("importExcel")
	public String importExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
		List<Student> studentList = ExcelUtiles.importExcel(file, 0, 1, Student.class);
		for (Student student : studentList) {
			studentService.add(student);
		}
		return "redirect:list";
	}
}
