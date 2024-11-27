// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/11/25 00:27:00
// @Desc
package api

import (
	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"meng-admin-gin/app/admin/dto"
	"meng-admin-gin/app/admin/models"
	"meng-admin-gin/app/admin/service"
	"meng-admin-gin/common/api"
	"meng-admin-gin/common/code"
	"meng-admin-gin/utils"
)

type FormGenerateApi struct {
	api.Api
}

func (e FormGenerateApi) GetPageList(c *gin.Context) {
	s := service.FormGenerateService{}
	req := dto.FormGenerateGetPageReq{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors

	if err != nil {
		e.Logger.Error(err.Error())
		e.Error(code.ERROR, err)
		return
	}
	list := make([]models.FormGenerate, 0)
	var count int64
	err = s.GetAPIPage(&req, &list, &count)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, "查询失败")
		return
	}

	e.PageOK(list, int(count), req.GetPageNum(), req.GetPageSize(), "查询成功")
}

func (e FormGenerateApi) GetDetailById(c *gin.Context) {
	s := service.FormGenerateService{}
	req := dto.FormGenerateGetReq{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req, binding.JSON, nil).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err.Error())
		e.Error(code.ERROR, err)
		return
	}
	var object models.FormGenerate

	err = s.Get(&req, &object)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, "查询失败")
		return
	}

	e.OK(object, "查询成功")
}

func (e FormGenerateApi) Insert(c *gin.Context) {
	s := service.FormGenerateService{}
	req := dto.FormGenerateInsertReq{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req, binding.JSON).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err.Error())
		e.Error(code.ERROR, err)
		return
	}
	// 设置创建人
	req.CreateBy = utils.GetUserId(c)
	err = s.Insert(&req)
	if err != nil {
		e.Logger.Error(err.Error())
		e.ErrorWithMsg(code.ERROR, err, "创建失败,"+err.Error())
		return
	}
	e.OK(req.GetId(), "创建成功")
}

func (e FormGenerateApi) Update(c *gin.Context) {
	s := service.FormGenerateService{}
	req := dto.FormGenerateUpdateReq{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err.Error())
		e.Error(code.ERROR, err)
		return
	}
	req.SetUpdateBy(utils.GetUserId(c))
	err = s.Update(&req)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, err.Error())
		return
	}
	e.OK(req.GetId(), "更新成功")
}

func (e FormGenerateApi) Delete(c *gin.Context) {
	s := service.FormGenerateService{}
	req := dto.FormGenerateDeleteReq{}
	err := e.MakeContext(c).
		MakeOrm().
		Bind(&req, binding.JSON, nil).
		MakeService(&s.Service).
		Errors
	if err != nil {
		e.Logger.Error(err.Error())
		e.Error(code.ERROR, err)
		return
	}

	err = s.Remove(&req)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, "删除失败")
		return
	}
	e.OK(req.GetId(), "删除成功")
}
