package models

type Claims struct {
	ID     int    `gorm:"primary_key" json:"claim_id"`
	AuthID int    `json:"auth_id"`
	Type   string `json:"type"`
	Value  string `json:"value"`
}

func GetUserClaims(userName string) (claims []Claims) {
	var auth Auth
	db.Where("username = ?", userName).First(&auth)
	db.Where("auth_id = ?", auth.ID).Find(&claims)
	return
}
