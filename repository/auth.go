package repository

import (
	"capstone-project/entity"

	"github.com/labstack/echo/v4"
)

func (r *repository) GetUserAuth(c echo.Context, user string) (*entity.Users, error) {
	var userDomain *entity.Users
	err := r.connection.First(&userDomain, "username = ? AND role = ?", user, "user").Error
	if userDomain.ID == "" {
		return nil, err
	}

	return userDomain, nil
}

func (r *repository) GetAdminAuth(c echo.Context, user string) (*entity.Users, error) {
	var adminDomain *entity.Users
	err := r.connection.First(&adminDomain, "username = ? AND role = ?", user, "admin").Error
	if adminDomain.ID == "" {
		return nil, err
	}

	return adminDomain, nil
}
