extends Button

@onready var http_request = $HTTPRequest
const URL = "https://5rwdzl-5000.csb.app"
var rote := "/"

signal info(data)

func _on_pressed():
	http_request.request(URL + rote)

func _on_http_request_request_completed(result, response_code, headers, body):
	var data = JSON.parse_string(body.get_string_from_utf8())
	print(data)
	info.emit(data)
