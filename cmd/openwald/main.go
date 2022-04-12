package main

import (
	"github.com/astaxie/beego"
	"github.com/openwald/openwald/pkg/routes"
)

func main() {
	routes.InitRoutes()
	beego.Run()
}
