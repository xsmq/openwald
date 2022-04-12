package routes

import (
	"github.com/astaxie/beego"
	"github.com/openwald/openwald/pkg/controller"
)

func InitRoutes() {
	beego.Router("/api/v1/health", &controller.HealthController{}, "Get:HealthCheck")
}
