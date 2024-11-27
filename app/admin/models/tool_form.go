// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/11/24 23:24:00
// @Desc
package models

import common "meng-admin-gin/common/model"

// 表单生成器
type FormGenerate struct {
	FormId     int    `json:"formId" gorm:"primaryKey;autoIncrement;"`              //主键
	FormName   string `json:"formName" gorm:"size:100"`                             //名称
	JsonSchema string `json:"jsonSchema" gorm:"type:text;"`                         //jsonSchema
	Sort       int    `json:"sort" gorm:"size:4;"`                                  //排序
	Status     int    `json:"status" gorm:"size:1;comment:状态 1:正常 0 停用; default:1"` //状态
	IsModel    bool   `json:"isModel"`                                              // 是否为典型案例
	common.ControlBy
	common.ModelTime
}

func (FormGenerate) TableName() string {
	return "form_generate"
}

func (e *FormGenerate) Generate() common.ActiveRecord {
	o := *e
	return &o
}

func (e *FormGenerate) GetId() interface{} {
	return e.FormId
}
