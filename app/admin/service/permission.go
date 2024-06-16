// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/6/3 22:08:00
// @Desc
package service

import (
	"meng-admin-gin/app/admin/models"
	"meng-admin-gin/common/service"
	"meng-admin-gin/utils"
)

type PermissionService struct {
	service.Service
}

func (s *PermissionService) GetMenuPermission(user *models.SysUser) ([]string, error) {
	permissions := make([]string, 0)
	if utils.IsAdminOfRoleCode(user.Role.RoleCode) { // 管理员拥有所有权限
		permissions = append(permissions, "*:*:*")
	} else {
		model := models.SysRole{}
		model.RoleId = user.Role.RoleId
		if err := s.Orm.Model(&model).Preload("SysMenu").First(&model).Error; err != nil {
			return nil, err
		}
		l := *model.SysMenu
		for i := 0; i < len(l); i++ {
			if l[i].Permission != "" {
				permissions = append(permissions, l[i].Permission)
			}
		}
	}
	return permissions, nil
}
