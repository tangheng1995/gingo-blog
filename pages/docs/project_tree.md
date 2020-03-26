---
title: 项目结构概览
layout: page
---


## Tree

```text
├─gingo
│  │  .env
│  │  .gitignore
│  │  go.mod
│  │  go.sum
│  │  LICENSE
│  │  main.go
│  │  README.md
│  │  routes.go
│  │  
│  ├─.vscode
│  │      launch.json
│  │      
│  ├─common
│  │      db.go
│  │      jwt.go
│  │      redis.go
│  │      
│  ├─config
│  │      config.go
│  │      
│  ├─controller
│  │      userController.go
│  │      
│  ├─dto
│  │      userDto.go
│  │      
│  ├─middleware
│  │      authMiddleware.go
│  │      corsMiddleware.go
│  │      
│  ├─model
│  │      user.go
│  │      
│  ├─response
│  │      response.go
│  │      
│  └─util
│          util.go
```

## 详情

- main.go ：程序入口
- routes.go ：路由入口
- .env ：环境变量配置
- common包 ：通用工具包
- config包 ：初始化配置包
- controller包 ：控制器包
- dto包 ：序列化对象输出格式
- middleware包 ：中间件包
- model包 ：模型对象
- response包 ：统一封装响应
- util包 ：工具包