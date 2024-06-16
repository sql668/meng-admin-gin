// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/15 21:49:00
// @Desc
package service

import (
	"errors"
	"fmt"
	"github.com/jinzhu/copier"
	"github.com/spf13/cast"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"meng-admin-gin/app/admin/dto"
	"meng-admin-gin/app/admin/models"
	cDto "meng-admin-gin/common/dto"
	cGorm "meng-admin-gin/common/gorm"
	"meng-admin-gin/common/service"
)

type SysRoleService struct {
	service.Service
}

// GetPage 获取SysRole列表
func (e *SysRoleService) GetPage(c *dto.SysRoleGetPageReq, list *[]models.SysRole, count *int64) error {
	var err error
	var data models.SysRole

	err = e.Orm.Model(&data).
		//.Preload("SysMenu").
		Scopes(
			cDto.MakeCondition(c.GetNeedSearch()),
			cDto.OrderDest("sort", false),
			cGorm.Paginate(c.GetPageNum(), c.GetPageSize()),
		).
		Find(list).Limit(-1).Offset(-1).
		Count(count).Error
	if err != nil {
		return err
	}
	return nil
}

// Get 获取SysRole对象
func (e *SysRoleService) Get(d *dto.SysRoleGetReq, model *models.SysRole) error {
	var err error
	//var data models.SysRole
	db := e.Orm.First(model, d.GetId())
	err = db.Error
	if err != nil && errors.Is(err, gorm.ErrRecordNotFound) {
		err = errors.New("查看对象不存在或无权查看")
		e.Log.Error(err.Error())
		return err
	}
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}
	menuIds := make([]int, 0)
	query := e.Orm.Table("sys_menu").Select("sys_menu.parent_id").Joins("INNER JOIN sys_role_menu rm ON sys_menu.menu_id = rm.menu_id AND rm.role_id = ?", d.GetId())
	err = e.Orm.Table("sys_menu").Select("sys_menu.menu_id").Joins("LEFT JOIN sys_role_menu rm ON sys_menu.menu_id = rm.menu_id").Where("rm.role_id = ?", d.GetId()).Where("sys_menu.menu_id not in (?)", query).Order("sys_menu.parent_id,sys_menu.sort").Scan(&menuIds).Error
	//model.MenuIds, err = e.GetRoleMenuId(model.RoleId)
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}
	var role models.SysRole
	role.RoleId = cast.ToUint(d.GetId())
	menuIds2 := make([]int, 0)
	err = e.Orm.Model(&role).Preload("SysMenu").First(&role).Error
	if role.SysMenu != nil {
		for _, menu := range *role.SysMenu {
			menuIds2 = append(menuIds2, menu.MenuId)
		}
	}

	model.MenuIds = menuIds
	model.MenuIds2 = menuIds2

	return nil
}

// Insert 创建SysRole对象
func (e *SysRoleService) Insert(c *dto.SysRoleInsertReq) error {
	var err error
	var data models.SysRole

	copier.Copy(&data, c)

	tx := e.Orm.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	var count int64
	err = tx.Model(&data).Where("role_code = ?", c.RoleCode).Count(&count).Error
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}

	if count > 0 {
		err = errors.New("roleCode已存在，需更换在提交！")
		e.Log.Error(err.Error())
		return err
	}

	err = tx.Create(&data).Error
	if err != nil {
		e.Log.Error(err.Error())
		return err
	}

	return nil
}

// Update 修改SysRole对象
func (e *SysRoleService) Update(c *dto.SysRoleUpdateReq) error {
	var err error
	var data models.SysRole
	if c.RoleCode == "admin" {
		return errors.New("admin角色不能修改")
	}
	tx := e.Orm.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	tx.First(&data, c.GetId())
	copier.Copy(&data, c)

	// 更新关联的数据，使用 FullSaveAssociations 模式
	//db := tx.Session(&gorm.Session{FullSaveAssociations: true}).Debug().Save(&data)
	db := tx.Save(&data)
	if err = db.Error; err != nil {
		e.Log.Error(err.Error())
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}

	return nil
}

// Remove 删除SysRole
func (e *SysRoleService) Remove(c *dto.SysRoleDeleteReq) error {
	var err error

	tx := e.Orm.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	var model = models.SysRole{}
	tx.Preload("SysMenu").Preload("SysDept").First(&model, c.GetId())
	if model.RoleCode == "admin" {
		return errors.New("admin角色不能修改")
	}
	//删除 SysRole 时，同时删除角色所有 关联其它表 记录 (SysMenu 和 SysMenu)
	db := tx.Select(clause.Associations).Delete(&model)

	if err = db.Error; err != nil {
		e.Log.Error(err.Error())
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}

	// 清除 sys_casbin_rule 权限表里 当前角色的所有记录
	//_, _ = cb.RemoveFilteredPolicy(0, model.RoleKey)

	return nil
}

// UpdateStatus 修改SysRole对象status
func (e *SysRoleService) UpdateStatus(c *dto.UpdateStatusReq) error {
	var err error
	tx := e.Orm.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	var model = models.SysRole{}
	tx.First(&model, c.GetId())
	if model.RoleCode == "admin" {
		return errors.New("admin角色不能修改")
	}
	copier.Copy(&model, c)
	// 更新关联的数据，使用 FullSaveAssociations 模式
	db := tx.Session(&gorm.Session{FullSaveAssociations: true}).Debug().Save(&model)
	if err = db.Error; err != nil {
		e.Log.Error(err.Error())
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return nil
}

func (e *SysRoleService) UpdateRoleMenu(c *dto.UpdateMenuAuthReq) error {
	var model = models.SysRole{}
	var mlist = make([]models.SysMenu, 0)
	var err error

	tx := e.Orm.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()

	tx.Preload("SysMenu").First(&model, c.GetId())
	tx.Where("menu_id in ?", c.MenuIds).Find(&mlist)
	err = tx.Model(&model).Association("SysMenu").Delete(model.SysMenu)
	if err != nil {
		e.Log.Error("delete policy error: " + err.Error())
		return err
	}
	model.SysMenu = &mlist
	// 更新关联的数据，使用 FullSaveAssociations 模式
	db := tx.Session(&gorm.Session{FullSaveAssociations: true}).Debug().Save(&model)
	if err = db.Error; err != nil {
		e.Log.Error("db error: " + err.Error())
		return err
	}
	if db.RowsAffected == 0 {
		return errors.New("无权更新该数据")
	}
	return err
}

func (e *SysRoleService) SelectDeptTreeList() (m []dto.DeptTree, err error) {
	list := make([]models.SysDept, 0)
	err = e.Orm.Find(&list).Error
	if err != nil {
		e.Log.Error(fmt.Sprintf("find dept list error, %s", err.Error()))
		return
	}
	m = make([]dto.DeptTree, 0)
	var item dto.DeptTree
	for i := range list {
		if list[i].ParentId != 0 {
			continue
		}
		item = dto.DeptTree{}
		item.Key = list[i].DeptId
		item.Title = list[i].DeptName
		deptInfo := deptTreelCall(&list, item)
		m = append(m, deptInfo)
	}
	return
}

func deptTreelCall(deptList *[]models.SysDept, dept dto.DeptTree) dto.DeptTree {
	list := *deptList
	var mi dto.DeptTree
	min := make([]dto.DeptTree, 0)
	for j := 0; j < len(list); j++ {
		if dept.Key != list[j].ParentId {
			continue
		}
		mi = dto.DeptTree{Key: list[j].DeptId, Title: list[j].DeptName, Children: []dto.DeptTree{}}
		ms := deptTreelCall(deptList, mi)
		min = append(min, ms)
	}
	dept.Children = min
	return dept
}

// SelectDeptListByRoleId 获取角色的部门ID集合
func (e *SysRoleService) SelectDeptListByRoleId(roleId int) ([]int, error) {
	deptIds := make([]int, 0)
	deptList := make([]dto.DeptIdList, 0)
	if err := e.Orm.Table("sys_role_dept").
		Select("sys_role_dept.dept_id").
		Joins("LEFT JOIN sys_dept on sys_dept.dept_id=sys_role_dept.dept_id").
		Where("role_id = ? ", roleId).
		Where(" sys_role_dept.dept_id not in(select sys_dept.parent_id from sys_role_dept LEFT JOIN sys_dept on sys_dept.dept_id=sys_role_dept.dept_id where role_id =? )", roleId).
		Find(&deptList).Error; err != nil {
		return nil, err
	}
	for i := 0; i < len(deptList); i++ {
		deptIds = append(deptIds, deptList[i].DeptId)
	}
	return deptIds, nil
}

func (e *SysRoleService) UpdateDataScope(c *dto.RoleDataScopeReq) *SysRoleService {
	var err error
	tx := e.Orm.Begin()
	defer func() {
		if err != nil {
			tx.Rollback()
		} else {
			tx.Commit()
		}
	}()
	var dlist = make([]models.SysDept, 0)
	var model = models.SysRole{}
	tx.Preload("SysDept").First(&model, c.RoleId)
	tx.Where("dept_id in ?", c.DeptIds).Find(&dlist)
	// 删除SysRole 和 SysDept 的关联关系
	err = tx.Model(&model).Association("SysDept").Delete(model.SysDept)
	if err != nil {
		e.Log.Error(fmt.Sprintf("delete SysDept error:%s", err.Error()))
		_ = e.AddError(err)
		return e
	}
	copier.Copy(&model, c)
	model.SysDept = dlist
	// 更新关联的数据，使用 FullSaveAssociations 模式
	db := tx.Model(&model).Session(&gorm.Session{FullSaveAssociations: true}).Debug().Save(&model)
	if err = db.Error; err != nil {
		e.Log.Error(fmt.Sprintf("delete SysDept error:%s", err.Error()))
		_ = e.AddError(err)
		return e
	}
	if db.RowsAffected == 0 {
		_ = e.AddError(errors.New("无权更新该数据"))
		return e
	}
	return e
}

func (e *SysRoleService) UpdateDefaultRouter(c *dto.UpdateDefaultRouterReq) error {
	var err error
	var model = models.SysRole{}
	model.RoleId = c.RoleId
	err = e.Orm.Model(&model).Update("default_router", c.DefaultRouter).Error
	if err != nil {
		e.Log.Error(fmt.Sprintf("UpdateDefaultRouter error, %s", err.Error()))
	}
	return err
}
