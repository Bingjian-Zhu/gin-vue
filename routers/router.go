package routers

import (
	"github.com/gin-gonic/gin"

	"gin-vue/middleware/cors"
	"gin-vue/middleware/myjwt"
	"gin-vue/pkg/setting"
	v1 "gin-vue/routers/api/v1"
	v2 "gin-vue/routers/api/v2"
)

func InitRouter() *gin.Engine {

	var authMiddleware = myjwt.GinJWTMiddlewareInit(myjwt.AdminAuthorizator)

	r := gin.New()

	r.Use(gin.Logger())

	r.Use(cors.CorsHandler())

	r.Use(gin.Recovery())

	gin.SetMode(setting.RunMode)

	r.POST("/login", authMiddleware.LoginHandler)

	r.NoRoute(authMiddleware.MiddlewareFunc(), myjwt.NoRouteHandler)

	auth := r.Group("/auth")
	// Refresh time can be longer than token timeout
	auth.GET("/refresh_token", authMiddleware.RefreshHandler)

	api := r.Group("")
	api.Use(authMiddleware.MiddlewareFunc())
	{
		api.GET("/user/info", v1.GetUserInfo)
		api.POST("/user/logout", v1.Logout)
		api.GET("/table/list", v2.GetArticles)
	}

	apiv1 := r.Group("/api/v1")
	apiv1.Use(authMiddleware.MiddlewareFunc())
	{
		//获取标签列表
		apiv1.GET("/tags", v1.GetTags)
		//新建标签
		apiv1.POST("/tags", v1.AddTag)
		//更新指定标签
		apiv1.PUT("/tags/:id", v1.EditTag)
		//删除指定标签
		apiv1.DELETE("/tags/:id", v1.DeleteTag)

		//获取文章列表
		apiv1.GET("/articles", v1.GetArticles)
		//获取指定文章
		apiv1.GET("/articles/:id", v1.GetArticle)
		//新建文章
		apiv1.POST("/articles", v1.AddArticle)
		//更新指定文章
		apiv1.PUT("/articles/:id", v1.EditArticle)
		//删除指定文章
		apiv1.DELETE("/articles/:id", v1.DeleteArticle)
	}

	var testMiddleware = myjwt.GinJWTMiddlewareInit(myjwt.TestAuthorizator)
	apiv2 := r.Group("/api/v2")
	apiv2.Use(testMiddleware.MiddlewareFunc())
	{
		//获取标签列表
		apiv2.GET("/tags", v1.GetTags)
		//新建标签
		apiv2.POST("/tags", v1.AddTag)
		//更新指定标签
		apiv2.PUT("/tags/:id", v1.EditTag)
		//删除指定标签
		apiv2.DELETE("/tags/:id", v1.DeleteTag)

		//获取文章列表
		apiv2.GET("/articles", v1.GetArticles)
		//获取指定文章
		apiv2.GET("/articles/:id", v1.GetArticle)
		//新建文章
		apiv2.POST("/articles", v1.AddArticle)
		//更新指定文章
		apiv2.PUT("/articles/:id", v1.EditArticle)
		//删除指定文章
		apiv2.DELETE("/articles/:id", v1.DeleteArticle)
	}

	return r
}
