// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/24 21:54:00
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

type SysApi struct {
	api.Api
}

func (e SysApi) GetPageList(c *gin.Context) {
	s := service.SysApiService{}
	req := dto.SysApiGetPageReq{}
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
	list := make([]models.SysApi, 0)
	var count int64
	err = s.GetAPIPage(&req, &list, &count)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, "查询失败")
		return
	}

	e.PageOK(list, int(count), req.GetPageNum(), req.GetPageSize(), "查询成功")
}

func (e SysApi) GetAll(c *gin.Context) {
	s := service.SysApiService{}
	err := e.MakeContext(c).
		MakeOrm().
		MakeService(&s.Service).
		Errors

	if err != nil {
		e.Logger.Error(err.Error())
		e.Error(code.ERROR, err)
		return
	}
	list := make([]models.SysApi, 0)
	err = s.GetAll(&list)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, "查询失败")
		return
	}

	e.OK(gin.H{
		"list": list,
	}, "查询成功")
}

func (e SysApi) GetDetailById(c *gin.Context) {
	s := service.SysApiService{}
	req := dto.SysAPiGetReq{}
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
	var object models.SysApi

	err = s.Get(&req, &object)
	if err != nil {
		e.ErrorWithMsg(code.ERROR, err, "查询失败")
		return
	}

	e.OK(object, "查询成功")
}

// Insert
// @Summary 创建api
// @Description 获取JSON
// @Tags 接口管理/Api
// @Accept  application/json
// @Product application/json
// @Param data body dto.SysRoleInsertReq true "data"
// @Success 200 {object} response.Response "{"code": 200, "data": [...]}"
// @Router /api/v1/role [post]
// @Security Bearer
func (e SysApi) Insert(c *gin.Context) {
	s := service.SysApiService{}
	req := dto.SysApiInsertReq{}
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

func (e SysApi) Update(c *gin.Context) {
	s := service.SysApiService{}
	req := dto.SysApiUpdateReq{}
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

func (e SysApi) Delete(c *gin.Context) {
	s := service.SysApiService{}
	req := dto.SysApiDeleteReq{}
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
