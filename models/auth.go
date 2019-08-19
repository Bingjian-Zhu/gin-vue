package models

type Auth struct {
	ID       int    `gorm:"primary_key" json:"id"`
	Username string `json:"username"`
	Password string `json:"password"`
	Avatar   string `json:"avatar"`
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

func GetUserID(username string) string {
	var auth Auth
	db.Select("avatar").Where(Auth{Username: username}).First(&auth)
	return auth.Avatar
}

func GetRoles(username string) []string {
	var auth Auth
	db.Select("id").Where(Auth{Username: username}).First(&auth)
	var claims []Claims
	db.Select("value").Where(Claims{AuthID: auth.ID}).Find(&claims)
	var roles []string
	for _, claim := range claims {
		roles = append(roles, claim.Value)
	}
	return roles
}
