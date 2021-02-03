package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/negroni-app/negroni-server/handlers"
)

func setEcho(routerGroup *gin.RouterGroup) {
	routerGroup.Any("/echo/:path", handlers.AnyEcho)

	// ex>
	// routerGroup.POST("/echo/:path", handlers.PostEcho)
	// routerGroup.GET("/echo/:path", handlers.GetEcho)
}
