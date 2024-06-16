// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/24 21:56:00
// @Desc

package dto

import (
	"meng-admin-gin/common/dto"
	common "meng-admin-gin/common/model"
)

type SysApiGetPageReq struct {
	dto.Pagination `search:"-"`
	Path           string `form:"path" search:"type:contains;column:path;table:sys_api" comment:"api路径"`
	Method         string `form:"method" search:"type:exact;column:method;table:sys_api" comment:"请求类型"`
	Remark         string `form:"remark" search:"type:contains;column:remark;table:sys_api" comment:"备注描述"`
	ApiGroup       string `form:"apiGroup" search:"type:contains;column:api_group;table:sys_api" comment:"api分组"`
}

func (m *SysApiGetPageReq) GetNeedSearch() interface{} {
	return *m
}

type SysAPiGetReq struct {
	Id int `uri:"id"`
}

func (s *SysAPiGetReq) GetId() interface{} {
	return s.Id
}

type SysApiInsertReq struct {
	ApiId    uint   `uri:"id" comment:"主键"`
	Path     string `form:"path" comment:"api路径" vd:"len($)>0"`
	Remark   string `form:"remark" comment:"描述备注" vd:"len($)>0"`
	Method   string `form:"method" comment:"请求方法" vd:"len($)>0"`
	ApiGroup string `form:"apiGroup" comment:"api分组" vd:"len($)>0"`
	common.ControlBy
}

func (s *SysApiInsertReq) GetId() interface{} {
	return s.ApiId
}

type SysApiUpdateReq struct {
	ApiId    uint   `uri:"id" comment:"主键"`
	Path     string `json:"path" comment:"api路径" vd:"len($)>0"`
	Method   string `json:"method" comment:"请求方法" vd:"len($)>0"`
	Remark   string `json:"remark" comment:"描述备注" vd:"len($)>0"`
	ApiGroup string `json:"apiGroup" comment:"api分组" vd:"len($)>0"`
	common.ControlBy
}

func (s *SysApiUpdateReq) GetId() interface{} {
	return s.ApiId
}

type SysApiDeleteReq struct {
	Ids []int `json:"ids"`
}

func (s *SysApiDeleteReq) GetId() interface{} {
	return s.Ids
}
