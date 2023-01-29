import os
from args_parser import args
from flask import Flask, request
from flask import render_template, send_file, redirect
app: Flask = Flask(__name__,
	static_url_path='/',
	static_folder="public/static/",
	template_folder="public/templates/"
)


@app.get('/')
def main() -> Flask.response_class:
	return render_template("list.html", files=[
		filename
			for filename
			in os.listdir(args.mods_path)
				if os.path.isfile(f"{args.mods_path}/{filename}")
	])

@app.get('/mods/<filename>')
def download(filename: str) -> Flask.response_class:
	if filename not in os.listdir(args.mods_path):
		return {"error": "File Not Found"}, 404
	else:
		return send_file(f"{args.mods_path}/{filename}", as_attachment=True), 200




if __name__ == '__main__':
	app.debug = args.debug
	app.config['JSON_AS_ASCII'] = False
	app.run(
		host=args.host,
		port=args.port
	)