extends Button

@onready var http_request = $HTTPRequest
const URL = "http://127.0.0.1:5000"
var rote := "/"

func _on_pressed():
	http_request.request(URL + rote)

func _on_http_request_request_completed(result, response_code, headers, body):
	var data = JSON.parse_string(body.get_string_from_utf8())
	print(data)

