extends Node2D


@onready var http_request = $HTTPRequest
@onready var leaderboard = $leaderboard
@onready var btns = $req_list/btn_list

const URL = "https://5rwdzl-5000.csb.app"
const rotesGet = {"GET": "/"}
const rotesPost = {"POST": "/post"}

@export var buttonGet: PackedScene
@export var buttonPost: PackedScene

func _ready():
	http_request.request(URL + "/")

func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if result == 0 and response_code == 200:
		for key in rotesGet:
			var new_button = buttonGet.instantiate()
			
			new_button.info.connect(display_data)
			new_button.text = key
			new_button.rote = rotesGet[key]
			
			btns.add_child(new_button)

func display_data(data):
	leaderboard.clear()
	var i = 1
	
	for item in data:
		var data_text = str(i) + "° lugar: " + item[1] + ", Points: " + str(item[2])
		leaderboard.add_text(data_text)
		leaderboard.newline()
		i+= 1
	leaderboard.newline()


