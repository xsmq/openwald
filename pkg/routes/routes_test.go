package routes

import "testing"

func TestInitRoutes(t *testing.T) {
	var tests = []struct {
		name string
	}{
		{
			name: "/api/v1/health",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
		})
	}
}
