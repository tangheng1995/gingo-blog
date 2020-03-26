---
title: 连接MySQL数据库
layout: page
---

## 安装

Install:

```text
go get github.com/jinzhu/gorm
go get github.com/go-sql-driver/mysql
```

Import:

```go
import "github.com/jinzhu/gorm"
import _ "github.com/go-sql-driver/mysql"
```

[Gorm Database QuickStart](https://gorm.io/zh_CN/docs/connecting_to_the_database.html)

## 修改 `.env` 文件数据库配置

```text
MYSQL_DSN="root:123456@tcp(localhost:3306)/gingo?charset=utf8&parseTime=True&loc=Local"
```

指定数据库：

```text
db_user:db_password@/db_name?charset=utf8&parseTime=True&loc=Local
```

想要能正确的处理 time.Time，你需要添加 parseTime 参数。 ([更多参数](https://github.com/go-sql-driver/mysql#parameters))

想要完全的支持 UTF-8 编码，你需要修改charset=utf8 为 charset=utf8mb4。 详情请查看 [utf8mb4](https://mathiasbynens.be/notes/mysql-utf8mb4).

## 连接MySQL数据库

先导入对应数据库的驱动，如MySQL：

```go
package common

import (
	"gingo/model"
	"log"
	"os"

	"github.com/jinzhu/gorm"
	"github.com/joho/godotenv"
)

// DB 实例
var DB *gorm.DB

// InitDB 初始化数据库
func InitDB() *gorm.DB {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	mysqlDSN := os.Getenv("MYSQL_DSN")
	db, err := gorm.Open("mysql", mysqlDSN)
	if err != nil {
		panic("failed to connect database,err:" + err.Error())
	}

	db.AutoMigrate(&model.User{})

	DB = db

	return db
}

// GetDB 获取数据库实例
func GetDB() *gorm.DB {
	return DB
}
```
