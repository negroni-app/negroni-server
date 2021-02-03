package main

import (
	"github.com/gin-gonic/gin"
	"github.com/negroni-app/negroni-server/routers"
)

func main() {
	server := gin.New()
	routers.InitRouters(server.Group("/"))
	server.Run()
}
