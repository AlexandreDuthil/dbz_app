package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

type characters struct {
	Id          uint
	Name        string
	Description string
}

var sonGoku = characters{Id: 1, Name: "Son Goku", Description: "The main character"}
var vegeta = characters{Id: 2, Name: "Vegeta", Description: "The secondary character"}

func main() {
	e := echo.New()
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"*"},
		AllowHeaders: []string{echo.HeaderOrigin, echo.HeaderContentType, echo.HeaderAccept},
	}))
	e.GET("/characters", func(c echo.Context) error {
		return c.JSON(http.StatusOK, []characters{sonGoku, vegeta})
	})
	e.Logger.Fatal(e.Start(":1323"))
}
