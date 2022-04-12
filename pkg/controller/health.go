package controller

import (
	"github.com/astaxie/beego"
)

type HealthController struct {
	beego.Controller
}

func (c *HealthController) HealthCheck() {
	c.TplName = "health.html"
	c.Data["name"] = "HealthCheck"
	_ = ctrl.Render()
}

