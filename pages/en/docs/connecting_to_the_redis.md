---
title: Connect to Redis
layout: page
---

## Install

Install：

```text
go get github.com/go-redis/redis
```

Import:

```go
import "github.com/go-redis/redis"
```

[Go Redis QuickStart](https://github.com/go-redis/redis#quickstart)

## Update `.env` file for redis Configration

```text
REDIS_ADDR="127.0.0.1:6379"
REDIS_PW="123456"
REDIS_DB=""
```

## Connect to Redis

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
