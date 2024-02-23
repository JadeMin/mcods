package router

import (
	_ "embed"
	os "os"
	fmt "fmt"
	fiber "github.com/gofiber/fiber/v2"
)

const (
	PATH string = "./mods"
)
var (
	//go:embed index.html
	indexHTML []byte

	mods []string = getList()
)



func getList() []string {
	result := []string{}

	files, err := os.ReadDir(PATH)
	if err != nil {
		panic(err)
	}

	for _, file := range files {
		if file.Type().IsRegular() {
			result = append(result, file.Name())
		}
	}

	return result
}

func Route(router fiber.Router) {
	router.Static("/download", PATH, fiber.Static{
		Compress: true,
		ByteRange: true,
		Browse: false,
	})


	router.Get("/", func(c *fiber.Ctx) error {
		c.Set(fiber.HeaderContentType, "text/html; charset=utf-8")

		return c.Send(indexHTML)
	})

	router.Get("/list", func(c *fiber.Ctx) error {
		result := ""
		for _, files := range mods {
			result += fmt.Sprintf(
				"<a href=\"/download/%s\" class=\"list-group-item list-group-item-dark\" download>%s</a>",
				files, files,
			)
		}

		return c.SendString(result)
	})
}