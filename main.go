package main

import (
	_ "embed"
	fmt "fmt"
	os "os"
	fiber "github.com/gofiber/fiber/v2"
)

const (
	HOST string = ""
	PORT string = ":3000"
	PATH string = "./mods"
)
var (
	//go:embed index.html
	page []byte

	app *fiber.App = fiber.New()
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



func main() {
	files := getList()

	app.Static("/download", PATH, fiber.Static{
		Compress: true,
		ByteRange: true,
		Browse: false,
	})

	app.Get("/", func(c *fiber.Ctx) error {
		c.Set("Content-Type", "text/html")
		return c.Send(page)
	})

	app.Get("/list", func(c *fiber.Ctx) error {
		result := ""

		for _, files := range files {
			result += fmt.Sprintf(
				"<a href=\"/download/%s\" class=\"list-group-item list-group-item-dark\" download>%s</a>",
				files, files,
			)
		}

		return c.SendString(result)
	})


	app.Listen(PORT)
}