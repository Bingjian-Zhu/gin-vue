package models

type Auth struct {
	ID       int    `gorm:"primary_key" json:"id"`
	Username string `json:"username"`
	Password string `json:"password"`
}

// User demo
type User struct {
	UserName   string
	UserClaims []Claims
}

func CheckAuth(username, password string) bool {
	var auth Auth
	db.Select("id").Where(Auth{Username: username, Password: password}).First(&auth)
	if auth.ID > 0 {
		return true
	}

	return false
}

// func GetUserID(username string) int {
// 	var auth Auth
// 	db.Select("id").Where(Auth{Username: username}).First(&auth)
// 	return auth.ID
// }
