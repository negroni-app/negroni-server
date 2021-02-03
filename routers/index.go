package routers

import "github.com/gin-gonic/gin"

func InitRouters(routerGroup *gin.RouterGroup) {
	setEcho(routerGroup)
}
