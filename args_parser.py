import os
import argparse
import jproperties
def obj(**kwargs: any) -> object:
	return type('',(object,), kwargs)()
def get_filedir(path: str) -> str:
	return os.path.join(os.getcwd(), path)


parser: argparse.ArgumentParser = argparse.ArgumentParser()
jp_parser: jproperties.Properties = jproperties.Properties()
with open(get_filedir("server.properties"), 'rb') as f:
	jp_parser.load(f, "utf-8")

parser.add_argument(
	"-c",
	"--host",
	type=str,
	default=(jp_parser.get("mcods-ip") or jp_parser.get("server-ip")).data,
	help="IP of the web server"
)
parser.add_argument(
	"-p",
	"--port",
	type=int,
	default=(jp_parser.get("mcods-port") or obj(data=25585)).data,
	help="Port of the web server"
)
parser.add_argument(
	"-mods",
	"--mods-path",
	type=str,
	default=get_filedir("mods\\"),
	help="Mods folder path of your Forge server"
)
parser.add_argument(
	"--debug",
	type=bool,
	action=argparse.BooleanOptionalAction,
	default=False,
	help="Flask debug mode"
)
args: argparse.Namespace = parser.parse_args()