// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/11/25 00:29:00
// @Desc
package dto

import (
	"meng-admin-gin/common/dto"
	common "meng-admin-gin/common/model"
)

// 新增
type FormGenerateInsertReq struct {
	FormId     int    `json:"formId" comment:"表单ID"` // 用户ID
	FormName   string `json:"formName" comment:"表单名称" vd:"len($)>0"`
	JsonSchema string `json:"jsonSchema" comment:"jsonSchema" vd:"len($)>0"`
	IsModel    bool   `json:"isModel" comment:"是否为典型案例"`
	Sort       int    `json:"sort" comment:"排序"`
	Status     int    `json:"status" comment:"状态"`
	common.ControlBy
}

func (s *FormGenerateInsertReq) GetId() interface{} {
	return s.FormId
}

type FormGenerateUpdateReq struct {
	FormId     uint   `uri:"id" comment:"主键"`
	FormName   string `json:"formName" comment:"表单名称" vd:"len($)>0"`
	JsonSchema string `json:"jsonSchema" comment:"jsonSchema" vd:"len($)>0"`
	IsModel    bool   `json:"isModel" comment:"是否为典型案例"`
	Sort       int    `json:"sort" comment:"排序"`
	Status     int    `json:"status" comment:"状态"`
	common.ControlBy
}

func (s *FormGenerateUpdateReq) GetId() interface{} {
	return s.FormId
}

// 分页查询
type FormGenerateGetPageReq struct {
	dto.Pagination `search:"-"`
	FormName       string `form:"formName" search:"type:contains;column:form_name;table:form_generate" comment:"名称"`
	IsModel        bool   `form:"isModel" search:"type:exact;column:is_model;table:form_generate" comment:"请求类型"`
	Status         string `form:"status" search:"type:exact;column:status;table:form_generate" comment:"备注描述"`
}

func (m *FormGenerateGetPageReq) GetNeedSearch() interface{} {
	return *m
}

// 根据id查询详细
type FormGenerateGetReq struct {
	Id int `uri:"id"`
}

func (s *FormGenerateGetReq) GetId() interface{} {
	return s.Id
}

type FormGenerateDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *FormGenerateDeleteReq) GetId() interface{} {
	return s.Ids
}
