---
title: Connecting to database
layout: page
---

## Install

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

## Update `.env` file for MySQL Configration

```text
MYSQL_DSN="root:123456@tcp(localhost:3306)/gingo?charset=utf8&parseTime=True&loc=Local"
```

Specifying the database:

```text
db_user:db_password@/db_name?charset=utf8&parseTime=True&loc=Local
```

Want to handle `time.Time` properly ,you need add Params `parseTime`. ([更多参数](https://github.com/go-sql-driver/mysql#parameters))

Want to support `UTF-8` ,you need to update `charset=utf8` to `charset=utf8mb4`.Details for [utf8mb4](https://mathiasbynens.be/notes/mysql-utf8mb4).

## Connect to MySQL database

In order to connect to a database, you need to import the database’s driver first. For example:

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
