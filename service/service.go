package service

import (
	"capstone-project/entity"
	"capstone-project/repository"
	"github.com/labstack/echo/v4"
)

type Service struct {
	repo repository.Repo
}

func NewService(repository repository.Repo) Svc {
	return &Service{
		repo: repository,
	}
}

type Svc interface {
	authSvc
	productSvc
	trasanctionSvc
	userSvc
}

type authSvc interface {
	Register(c echo.Context, user entity.Users) (*entity.RegisterView, error)
}

type productSvc interface{}

type trasanctionSvc interface{}

type userSvc interface{}
