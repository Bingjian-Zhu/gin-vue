# gin-vue

该项目是gin+vue的前后端分离项目，使用gorm访问MySQL

使用jwt，对API接口进行权限控制。[教程](https://www.cnblogs.com/FireworksEasyCool/p/11455834.html)

在token过期后的半个小时内，用户再次操作会自动刷新token

### go后台程序运行方式

1.在MySQL中运行文件夹/docs/sql中的mysql.sql脚本

2.在文件夹/conf中修改配置文件api.ini中的数据库连接配置

3.在gin-vue目录下运行`go run main.go`

### vue运行方式请看文件夹/vue-admin中的README.md

喜欢请star

推荐一个项目（[gin-vue-admin](https://github.com/Bingjian-Zhu/gin-vue-admin)），它是基于这个项目的基础上改进的，用依赖注入的方式对项目进行解耦
