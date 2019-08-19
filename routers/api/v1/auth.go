package v1

import (
	"net/http"

	jwt "github.com/appleboy/gin-jwt"
	"github.com/gin-gonic/gin"

	"gin-blog/models"
	"gin-blog/pkg/e"
	"gin-blog/viewModels"
)

func GetUserInfo(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	userName := claims["userName"].(string)
	avatar := models.GetUserID(userName)

	code := e.SUCCESS
	userRoles := models.GetRoles(userName)
	data := viewModels.User{Roles: userRoles, Introduction: "", Avatar: avatar, Name: userName}

	c.JSON(http.StatusOK, gin.H{
		"code": code,
		"msg":  e.GetMsg(code),
		// "data": map[string]string{"name": userName, "avatar": avatar},
		"data": data,
	})
}

func Logout(c *gin.Context) {
	code := e.SUCCESS
	c.JSON(http.StatusOK, gin.H{
		"code": code,
		"msg":  e.GetMsg(code),
		"data": "success",
	})
}
