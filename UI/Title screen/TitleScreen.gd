extends Control


onready var menu = $Menu/CenterRow/Buttons


func _ready():
	for button in menu.get_children():
		button.connect("pressed", self, "on_Button_pressed", [button.scene_to_load])

func on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
