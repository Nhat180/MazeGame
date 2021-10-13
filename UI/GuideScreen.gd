extends Control


onready var playButton = $Play
onready var backButton = $Back


func _ready():
	playButton.connect("pressed", self, "on_Button_pressed", [playButton.scene_to_load])
	backButton.connect("pressed", self, "on_Button_pressed", [backButton.scene_to_load])

func on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)

