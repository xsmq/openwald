package controller

import (
	"github.com/astaxie/beego"
	"testing"
)

func TestHealthController_HealthCheck(t *testing.T) {
	type fields struct {
		Controller beego.Controller
	}
	tests := []struct {
		name string
		fields fields
	}{
		{
			name: "HealthCheck",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			_ = &HealthController{
				Controller: tt.fields.Controller,
			}
		})
	}
}
