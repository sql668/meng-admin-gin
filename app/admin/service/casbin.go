// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/26 14:48:00
// @Desc
package service

import (
	"fmt"
	"meng-admin-gin/app/admin/dto"
	"meng-admin-gin/common/service"
	"meng-admin-gin/global"
)

type CasbinService struct {
	service.Service
}

func (e *CasbinService) UpdateCasbin(roleCode string, casbinInfos []dto.CasbinInfo) error {
	var err error
	// 清除 sys_casbin_rule 权限表里 当前角色的所有记录
	_, err = global.CASBIN.RemoveFilteredPolicy(0, roleCode)
	if err != nil {
		e.Log.Error(fmt.Sprintf("delete policy error:%s", err.Error()))
		return err
	}
	rules := [][]string{}
	//做权限去重处理
	deduplicateMap := make(map[string]bool)
	for _, v := range casbinInfos {
		key := roleCode + v.Path + v.Method
		if _, ok := deduplicateMap[key]; !ok {
			deduplicateMap[key] = true
			rules = append(rules, []string{roleCode, v.Path, v.Method})
		}
	}
	// 写入 sys_casbin_rule 权限表里 当前角色数据的记录
	_, err = global.CASBIN.AddNamedPolicies("p", rules)
	if err != nil {
		return err
	}
	return nil
}

func (e *CasbinService) GetPolicyPathByRoleCode(roleCode string) (pathMaps []dto.CasbinInfo) {
	casbin := global.CASBIN
	list := casbin.GetFilteredPolicy(0, roleCode)
	for _, v := range list {
		pathMaps = append(pathMaps, dto.CasbinInfo{
			Path:   v[1],
			Method: v[2],
		})
	}
	return pathMaps
}
