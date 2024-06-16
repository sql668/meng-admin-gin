// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/25 14:32:00
// @Desc
package service

import (
	"errors"
	"github.com/jinzhu/copier"
	"gorm.io/gorm"
	"meng-admin-gin/app/admin/dto"
	"meng-admin-gin/app/admin/models"
	cDto "meng-admin-gin/common/dto"
	cGorm "meng-admin-gin/common/gorm"
	"meng-admin-gin/common/service"
)

type SysApiService struct {
	service.Service
}

func (e *SysApiService) GetAPIPage(c *dto.SysApiGetPageReq, list *[]models.SysApi, count *int64) error {
	//var list []models.SysDept
	var err error
	var model models.SysApi
	err = e.Orm.Model(&model).Scopes(
		cDto.MakeCondition(c.GetNeedSearch()),
		cDto.OrderDest("created_at", false),
		cGorm.Paginate(c.GetPageNum(), c.GetPageSize()),
	).Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		return err
	}
	return nil
}

func (e *SysApiService) GetAll(list *[]models.SysApi) error {
	//var list []models.SysDept
	var err error
	var model models.SysApi
	err = e.Orm.Model(&model).Scopes(
		cDto.OrderDest("created_at", false),
	).Find(list).Error
	if err != nil {
		return err
	}
	return nil
}

func (e *SysApiService) Get(d *dto.SysAPiGetReq, model *models.SysApi) error {
	var err error
	var data models.SysApi

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

// Insert 创建SysApi对象
func (e *SysApiService) Insert(c *dto.SysApiInsertReq) error {
	var err error
	var data models.SysApi
	copier.Copy(&data, c)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}
	return nil
}

// Update 修改SysApi对象
func (e *SysApiService) Update(c *dto.SysApiUpdateReq) error {
	var err error
	var model = models.SysApi{}

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

	db := tx.Save(&model)
	if err = db.Error; err != nil {
		e.Log.Error(err.Error())
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

// Remove 删除SysDept
func (e *SysApiService) Remove(d *dto.SysApiDeleteReq) error {
	var err error
	var data models.SysApi

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
