package emun

var ArticleStatus = map[int]string{
	-1: "error",     //出现未定义状态
	0:  "published", //已发布
	1:  "draft",     //编辑中
	2:  "deleted",   //已删除
}

func GetArticleStatus(code int) string {
	msg, ok := ArticleStatus[code]
	if ok {
		return msg
	}

	return ArticleStatus[-1]
}
