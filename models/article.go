package models

import (
	"time"

	"github.com/jinzhu/gorm"
)

type Article struct {
	Model

	State         int    `json:"state"`
	TagId         int    `json:"tag_id"`
	Title         string `json:"title"`
	Desc          string `json:"desc"`
	Content       string `json:"Content"`
	CoverImageUrl string `json:"cover_image_url"`
	CreatedBy     string `json:"created_by"`
	Tag           Tag    `json:"tag"`
}

func (tag *Article) BeforeCreate(scope *gorm.Scope) error {
	scope.SetColumn("CreatedOn", time.Now().Unix())

	return nil
}

func (tag *Article) BeforeUpdate(scope *gorm.Scope) error {
	scope.SetColumn("ModifiedOn", time.Now().Unix())

	return nil
}

func GetArticle(id int) (article Article) {
	db.Where("id = ?", id).First(&article)
	db.Where("id = ?", article.TagId).First(&article.Tag)
	//db.Model(&article).Related(&article.Tag)
	return
}

func GetArticles(PageNum int, PageSize int, maps interface{}) (article []Article) {
	db.Where(maps).Offset(PageNum).Limit(PageSize).Find(&article)
	return
}

func AddArticle(data map[string]interface{}) bool {
	db.Create(&Article{
		TagId:     data["tag_id"].(int),
		Title:     data["title"].(string),
		Desc:      data["desc"].(string),
		Content:   data["content"].(string),
		CreatedBy: data["created_by"].(string),
		State:     data["state"].(int),
	})

	return true
}

func EditArticle(id int, maps interface{}) bool {
	db.Model(&Article{}).Where("id = ?", id).Update(maps)
	return true
}

func DeleteArticle(id int) bool {
	db.Where("id = ?", id).Delete(&Article{})
	return true
}

func ExistArticleByID(id int) bool {
	var article Article
	db.Select("id").Where("id = ?", id).First(&article)
	if article.ID > 0 {
		return true
	}
	return false
}

func GetArticleTotal(maps interface{}) (count int) {
	db.Model(&Article{}).Where(maps).Count(&count)
	return
}
