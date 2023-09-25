extends Node

@onready var http_request = $HTTPRequest
const URL = "https://5rwdzl-5000.csb.app"
var rote := "/post"

var headers = ["Content-Type: application/json"]

func _on_pressed():
	var json = JSON.stringify({"player": $player.text, "score": $score.text})
	http_request.request(URL + rote, headers, HTTPClient.METHOD_POST, json)


func _on_http_request_request_completed(result, response_code, headers, body):
	var data = JSON.parse_string(body.get_string_from_utf8())
	print(data)
