/*
Copyright 2022 The Openwald Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

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
	_ = c.Render()
}

func (c *HealthController) HelloOpenwald() {
	c.Ctx.WriteString("<!DOCTYPE html>\n<html>\n<head>\n\t<meta charset=\"uft-8\">\n\t<title>hello</title>\n" + 
		"</head>\n<body>\n\t<h1>Welcome to Openwald Community!</h1>\n</body>\n</html>")
}
