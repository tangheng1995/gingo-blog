---
title: Project Overview
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

## Details

- main.go ：Program entrypoint
- routes.go ：routes
- .env ：environment variable configration file
- common ：common tools package
- config ：initialize config package
- controller ：controller package
- dto ：serialize object package
- middleware ：middleware package
- model ：model package
- response ：response package
- util ：util tool package