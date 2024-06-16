// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/26 11:09:00
// @Desc
package middleware

import (
	"fmt"
	"github.com/casbin/casbin/v2/util"
	"github.com/gin-gonic/gin"
	"meng-admin-gin/common/code"
	"meng-admin-gin/common/response"
	"meng-admin-gin/global"
	"meng-admin-gin/utils"
	"net/http"
)

type UrlInfo struct {
	Url    string
	Method string
}

// CasbinExclude casbin 排除的路由列表
var CasbinExclude = []UrlInfo{
	{Url: "/api/v1/dict/type-option-select", Method: "GET"},
	{Url: "/api/v1/dict-data/option-select", Method: "GET"},
	{Url: "/api/v1/deptTree", Method: "GET"},
	{Url: "/api/v1/db/tables/page", Method: "GET"},
	{Url: "/api/v1/db/columns/page", Method: "GET"},
	{Url: "/api/v1/gen/toproject/:tableId", Method: "GET"},
	{Url: "/api/v1/gen/todb/:tableId", Method: "GET"},
	{Url: "/api/v1/gen/tabletree", Method: "GET"},
	{Url: "/api/v1/gen/preview/:tableId", Method: "GET"},
	{Url: "/api/v1/gen/apitofile/:tableId", Method: "GET"},
	{Url: "/api/v1/getCaptcha", Method: "GET"},
	{Url: "/api/v1/getinfo", Method: "GET"},
	{Url: "/api/v1/menuTreeselect", Method: "GET"},
	{Url: "/api/v1/menurole", Method: "GET"},
	{Url: "/api/v1/menuids", Method: "GET"},
	{Url: "/api/v1/roleMenuTreeselect/:roleId", Method: "GET"},
	{Url: "/api/v1/roleDeptTreeselect/:roleId", Method: "GET"},
	{Url: "/api/v1/refresh_token", Method: "GET"},
	{Url: "/api/v1/configKey/:configKey", Method: "GET"},
	{Url: "/api/v1/app-config", Method: "GET"},
	{Url: "/api/v1/user/profile", Method: "GET"},
	{Url: "/info", Method: "GET"},
	{Url: "/api/v1/login", Method: "POST"},
	{Url: "/api/v1/logout", Method: "POST"},
	{Url: "/api/v1/user/avatar", Method: "POST"},
	{Url: "/api/v1/user/pwd", Method: "PUT"},
	{Url: "/api/v1/metrics", Method: "GET"},
	{Url: "/api/v1/health", Method: "GET"},
	{Url: "/", Method: "GET"},
	{Url: "/api/v1/server-monitor", Method: "GET"},
	{Url: "/api/v1/public/uploadFile", Method: "POST"},
	{Url: "/api/v1/user/pwd/set", Method: "PUT"},
	{Url: "/api/v1/sys-user", Method: "PUT"},
}

// AuthCheckRole 权限检查中间件
func AuthCheckRole() gin.HandlerFunc {
	return func(c *gin.Context) {
		log := global.MA_LOG
		e := global.CASBIN
		// 角色编码
		roleCode := utils.GetRoleCode(c)
		var res, casbinExclude bool
		var err error
		//检查权限
		if roleCode == "admin" {
			res = true
			c.Next()
			return
		}
		for _, i := range CasbinExclude {
			if util.KeyMatch2(c.Request.URL.Path, i.Url) && c.Request.Method == i.Method {
				casbinExclude = true
				break
			}
		}
		if casbinExclude {
			log.Info(fmt.Sprintf("Casbin exclusion, no validation method:%s path:%s", c.Request.Method, c.Request.URL.Path))
			c.Next()
			return
		}
		res, err = e.Enforce(roleCode, c.Request.URL.Path, c.Request.Method)
		if err != nil {
			log.Error(fmt.Sprintf("AuthCheckRole error:%s method:%s path:%s", err, c.Request.Method, c.Request.URL.Path))
			response.Error(c, 500, err, "")
			return
		}

		if res {
			log.Info(fmt.Sprintf("isTrue: %v role: %s method: %s path: %s", res, roleCode, c.Request.Method, c.Request.URL.Path))
			c.Next()
		} else {
			log.Warn(fmt.Sprintf("isTrue: %v role: %s method: %s path: %s message: %s", res, roleCode, c.Request.Method, c.Request.URL.Path, "当前request无权限，请管理员确认！"))
			c.JSON(http.StatusOK, gin.H{
				"code": code.FORBIDDEN, //禁止访问
				"msg":  "对不起，您没有该接口访问权限，请联系管理员",
			})
			c.Abort()
			return
		}

	}
}
