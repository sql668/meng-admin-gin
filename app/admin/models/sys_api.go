// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/3/27 23:39:00
// @Desc
package models

import (
	common "meng-admin-gin/common/model"
)

type SysApi struct {
	ApiId uint `json:"apiId" gorm:"primaryKey;autoIncrement;comment:主键编码"`
	//Handle   string `json:"handle" gorm:"size:128;comment:handle"`
	//Title    string `json:"title" gorm:"size:128;comment:标题"`
	ApiGroup string `json:"apiGroup" gorm:"comment:api组"` // api组
	Path     string `json:"path" gorm:"size:128;comment:api路径"`
	//Action   string `json:"action" gorm:"size:16;comment:请求类型"`
	Method string `json:"method" gorm:"size:16;comment:接口类型POST|PUT|DELETE|GET"`
	Remark string `json:"remark" gorm:"size:255;"` //备注

	common.ModelTime
	common.ControlBy
}

func (*SysApi) TableName() string {
	return "sys_api"
}

func (e *SysApi) Generate() common.ActiveRecord {
	o := *e
	return &o
}

func (e *SysApi) GetId() interface{} {
	return e.ApiId
}
