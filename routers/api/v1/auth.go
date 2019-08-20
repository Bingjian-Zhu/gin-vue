package v1

import (
	"net/http"

	jwt "github.com/appleboy/gin-jwt"
	"github.com/gin-gonic/gin"

	"gin-vue/models"
	"gin-vue/pkg/e"
	"gin-vue/viewModels"
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
