// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/12 17:23:00
// @Desc
package service

import (
	"errors"
	"fmt"
	"github.com/jinzhu/copier"
	"github.com/spf13/cast"
	"gorm.io/gorm"
	"meng-admin-gin/app/admin/dto"
	"meng-admin-gin/app/admin/models"
	cDto "meng-admin-gin/common/dto"
	"meng-admin-gin/common/service"
)

type SysDeptService struct {
	service.Service
}

func (e *SysDeptService) GetDeptPage(c *dto.SysDeptGetPageReq) (m []models.SysDept, err error) {
	//var list []models.SysDept
	var model models.SysDept
	err = e.Orm.Model(&model).Scopes(
		cDto.OrderDest("sort", false),
		cDto.MakeCondition(c.GetNeedSearch()),
	).Find(&m).Error
	if err != nil {
		return
	}
	return
}

func (e *SysDeptService) Get(d *dto.SysDeptGetReq, model *models.SysDept) error {
	var err error
	var data models.SysDept

	db := e.Orm.Model(&data).
		First(model, d.GetId())
	err = db.Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Error(err.Error())
		return err
	}
	if err = db.Error; err != nil {
		e.Log.Error(err.Error())
		return err
	}
	return nil
}

// Insert 创建SysDept对象
func (e *SysDeptService) Insert(c *dto.SysDeptInsertReq) error {
	var err error
	var data models.SysDept
	copier.Copy(&data, c)

	tx := e.Orm.Debug().Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	err = tx.Create(&data).Error
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}
	deptPath := cast.ToString(data.DeptId) + "/"
	if data.ParentId != 0 {
		var deptP models.SysDept
		tx.First(&deptP, data.ParentId)
		deptPath = deptP.DeptPath + deptPath
	} else {
		deptPath = "/0/" + deptPath
	}
	var mp = map[string]string{}
	mp["dept_path"] = deptPath
	if err := tx.Model(&data).Update("dept_path", deptPath).Error; err != nil {
		e.Log.Error(fmt.Sprintf("db error:%s", err.Error()))
		return err
	}
	return nil
}

// Update 修改SysDept对象
func (e *SysDeptService) Update(c *dto.SysDeptUpdateReq) error {
	var err error
	var model = models.SysDept{}

	tx := e.Orm.Debug().Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	tx.First(&model, c.GetId())

	copier.Copy(&model, c)

	deptPath := cast.ToString(model.DeptId) + "/"
	if model.ParentId != 0 {
		var deptP models.SysDept
		tx.First(&deptP, model.ParentId)
		deptPath = deptP.DeptPath + deptPath
	} else {
		deptPath = "/0/" + deptPath
	}
	model.DeptPath = deptPath
	db := tx.Save(&model)
	if err = db.Error; err != nil {
		e.Log.Error(fmt.Sprintf("UpdateSysDept error:%s", err.Error()))
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysDept
func (e *SysDeptService) Remove(d *dto.SysDeptDeleteReq) error {
	var err error
	var data models.SysDept

	db := e.Orm.Model(&data).Delete(&data, d.GetId())
	if err = db.Error; err != nil {
		err = db.Error
		e.Log.Error(err.Error())
		return err
	}
	if db.RowsAffected == 0 {
		err = errors.New("无权删除该数据")
		return err
	}
	return nil
}
