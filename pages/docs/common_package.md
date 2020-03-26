---
title: Common包
layout: page
---

## db.go

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

## jwt.go

```go
package common

import (
	"gingo/model"
	"time"

	"github.com/dgrijalva/jwt-go"
)

var jwtKey = []byte("jwt_key")

// Claims jwt
type Claims struct {
	UserID uint
	jwt.StandardClaims
}

// ReleaseToken 发放token
func ReleaseToken(user model.User) (string, error) {
	expiresTime := time.Now().Add(7 * 24 * time.Hour)
	claims := &Claims{
		UserID: user.ID,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expiresTime.Unix(),
			IssuedAt:  time.Now().Unix(),
			Issuer:    "gingo",
			Subject:   "user token",
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString(jwtKey)

	if err != nil {
		return "", err
	}

	return tokenString, nil
}

// ParseToken 解析token
func ParseToken(tokenString string) (*jwt.Token, *Claims, error) {
	claims := &Claims{}

	token, err := jwt.ParseWithClaims(tokenString, claims, 
	func(token *jwt.Token) (i interface{}, err error) {
		return jwtKey, nil
	})

	return token, claims, err
}
```

## redis.go

```go
package common

import (
	"log"
	"os"

	"github.com/go-redis/redis"
	"github.com/joho/godotenv"
)

// RedisClient 实例
var RedisClient *redis.Client

// InitRedis 初始化Redis
func InitRedis() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	client := redis.NewClient(&redis.Options{
		Addr:     os.Getenv("REDIS_ADDR"),
		Password: os.Getenv("REDIS_PW"),
		DB:       0, // use default DB
	})

	_, err = client.Ping().Result()
	if err != nil {
		panic("failed to connect redis,err:" + err.Error())
	}

	RedisClient = client

}
```