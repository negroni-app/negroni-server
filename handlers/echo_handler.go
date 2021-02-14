package handlers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func AnyEcho(context *gin.Context) {
	var path string = context.Param("path")
	var query string = context.Query("query")
	context.String(http.StatusOK, "path: %s, query: %s",  path, query)
}
