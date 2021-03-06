package com.msr.entity;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class Attendance{
	@Excel(name = "编号", orderNum = "0",width=5)
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer aId;
	
	@Excel(name = "学生姓名", orderNum = "1")
    private String stuName;
	 
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date aDate;
    
    @Excel(name = "签到日期", orderNum = "2",exportFormat="yyyy-MM-dd")
    private String exportDate;

    @Excel(name = "1", orderNum = "3",width = 5)
    private String a1;

    @Excel(name = "2", orderNum = "4",width = 5)
    private String a2;

    @Excel(name = "3", orderNum = "5",width = 5)
    private String a3;

    @Excel(name = "4", orderNum = "6",width = 5)
    private String a4;

    @Excel(name = "5", orderNum = "7",width = 5)
    private String a5;

    @Excel(name = "6", orderNum = "8",width = 5)
    private String a6;

    @Excel(name = "7", orderNum = "9",width = 5)
    private String a7;

    @Excel(name = "8", orderNum = "10",width = 5)
    private String a8;

    @Excel(name = "类型",replace = {"正常_0", "迟到_1", "旷课_2", "早退_3", "病假_4", "事假_5"}, orderNum = "11")
    private String aType;

    
    @Excel(name = "企业名称", orderNum = "12",width = 25)
    private String companyName;
    
    @Excel(name = "班级名称", orderNum = "13",width = 15)
    private String clazzName;
    
    @Excel(name = "学生签字", orderNum = "14",width = 10)
    private String signature;
    private Integer stuId;
    private Integer teacherId;
    private Integer companyId;
    private Integer clazzId;
    
    
	public String getExportDate() {
		return exportDate;
	}

	public void setExportDate(String exportDate) {
		this.exportDate = exportDate;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getClazzName() {
		return clazzName;
	}

	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public Date getaDate() {
        return aDate;
    }

    public void setaDate(Date aDate) {
        this.aDate =aDate;
    }

    public String getA1() {
        return a1;
    }

    public void setA1(String a1) {
        this.a1 = a1 == null ? null : a1.trim();
    }

    public String getA2() {
        return a2;
    }

    public void setA2(String a2) {
        this.a2 = a2 == null ? null : a2.trim();
    }

    public String getA3() {
        return a3;
    }

    public void setA3(String a3) {
        this.a3 = a3 == null ? null : a3.trim();
    }

    public String getA4() {
        return a4;
    }

    public void setA4(String a4) {
        this.a4 = a4 == null ? null : a4.trim();
    }

    public String getA5() {
        return a5;
    }

    public void setA5(String a5) {
        this.a5 = a5 == null ? null : a5.trim();
    }

    public String getA6() {
        return a6;
    }

    public void setA6(String a6) {
        this.a6 = a6 == null ? null : a6.trim();
    }

    public String getA7() {
        return a7;
    }

    public void setA7(String a7) {
        this.a7 = a7 == null ? null : a7.trim();
    }

    public String getA8() {
        return a8;
    }

    public void setA8(String a8) {
        this.a8 = a8 == null ? null : a8.trim();
    }

    public String getaType() {
        return aType;
    }

    public void setaType(String aType) {
        this.aType = aType == null ? null : aType.trim();
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature == null ? null : signature.trim();
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getClazzId() {
        return clazzId;
    }

    public void setClazzId(Integer clazzId) {
        this.clazzId = clazzId;
    }
}