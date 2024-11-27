// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/11/25 00:28:00
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

type FormGenerateService struct {
	service.Service
}

func (e *FormGenerateService) GetAPIPage(c *dto.FormGenerateGetPageReq, list *[]models.FormGenerate, count *int64) error {
	//var list []models.SysDept
	var err error
	var model models.FormGenerate
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

func (e *FormGenerateService) Get(d *dto.FormGenerateGetReq, model *models.FormGenerate) error {
	var err error
	var data models.FormGenerate

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

// Insert 创建FormGenerate对象
func (e *FormGenerateService) Insert(c *dto.FormGenerateInsertReq) error {
	var err error
	var data models.FormGenerate
	copier.Copy(&data, c)
	err = e.Orm.Create(&data).Error
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}
	return nil
}

func (e *FormGenerateService) Update(c *dto.FormGenerateUpdateReq) error {
	var err error
	var model = models.FormGenerate{}

	tx := e.Orm.Debug().Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	tx.First(&model, c.GetId())
	//fmt.Print("=======", model)
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

func (e *FormGenerateService) Remove(d *dto.FormGenerateDeleteReq) error {
	var err error
	var data models.FormGenerate

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
