extends StaticBody2D

const OpenEffect = preload("res://Effect/OpenChestEffect.tscn")

onready var playerDetect = $PlayerDetection
onready var sprite = $AnimatedSprite
onready var timer = $Timer

var item = ItemStats

func _process(_delta):
	if seekPlayer():
		if item.coin >= 5 and item.key == 1:
			item.key = 0
			openChest()
		else:
			pass

func seekPlayer():
	return playerDetect.can_see_player()

# The open effect of the chest
func openChest():
	sprite.hide()
	var openEffect = OpenEffect.instance()
	get_parent().add_child(openEffect)
	openEffect.global_position = global_position
	timer.start(1)

# Change to victory screen 
func _on_Timer_timeout():
	get_tree().change_scene("res://UI/WinScreen.tscn")
