// @Author [shiqingliang](https://github.com/qianxunyimeng)
// @Date 2024/11/25 21:58:00
// @Desc
package router

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"meng-admin-gin/app/admin/api"
	"meng-admin-gin/common/actions"
	"meng-admin-gin/common/middleware"
	jwt "meng-admin-gin/core/jwtauth"
)

func init() {
	routerCheckRole = append(routerCheckRole, registerFormGenerateRouter)
}

func registerFormGenerateRouter(v1 *gin.RouterGroup, authMiddleware *jwt.GinJWTMiddleware) {
	fmt.Print("registerFormGenerateRouter。。。。。")
	api := api.FormGenerateApi{}
	r := v1.Group("/tools/form").Use(middleware.JWTAuth()).Use(middleware.AuthCheckRole()).Use(actions.DataScopeCheck())
	{
		r.GET("", api.GetPageList)
		r.POST("", api.Insert)
		r.GET("/:id", api.GetDetailById)
		r.PUT("/:id", api.Update)
		r.DELETE("", api.Delete)
	}
}
