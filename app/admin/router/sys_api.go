// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/5/25 15:27:00
// @Desc
package router

import (
	"github.com/gin-gonic/gin"
	"meng-admin-gin/app/admin/api"
	"meng-admin-gin/common/actions"
	"meng-admin-gin/common/middleware"
	jwt "meng-admin-gin/core/jwtauth"
)

func init() {
	routerCheckRole = append(routerCheckRole, registerSysApiRouter)
}

func registerSysApiRouter(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware) {
	api := api.SysApi{}
	r := v1.Group("/sys-api").Use(middleware.JWTAuth()).Use(middleware.AuthCheckRole()).Use(actions.DataScopeCheck())
	{
		r.GET("", api.GetPageList)
		r.GET("/all", api.GetAll)
		r.POST("", api.Insert)
		r.GET("/:id", api.GetDetailById)
		r.PUT("/:id", api.Update)
		r.DELETE("", api.Delete)
	}
}
