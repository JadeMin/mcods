package main

import (
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
	app *fiber.App = fiber.New()
)

func GetList() []string {
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
	/*app.Get("/download/:file", func(c *fiber.Ctx) error {
		filename := c.Params("file")
		path := fmt.Sprintf("./files/%s", filename)

		_, notExist := os.Stat(path)
		if notExist != nil {
			return c.Status(404).SendString("File not found")
		}

		return c.SendFile(path)
	})*/
	files := GetList()

	app.Static("/download", PATH, fiber.Static{
		Compress: true,
		ByteRange: true,
		Browse: false,
	})

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendFile("./public/index.html")
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