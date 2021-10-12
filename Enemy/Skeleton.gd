extends StaticBody2D

const DeathEffect = preload("res://Effect/DeathEffect.tscn")

onready var sprite = $AnimatedSprite
onready var playerDetection = $PlayerDetection

var item = ItemStats
var velocity = Vector2.ZERO
var player = null

func _process(delta):
	if seekPlayer():
		player = playerDetection.player
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * delta
		sprite.flip_h = velocity.x < 0

func seekPlayer():
	return playerDetection.can_see_player()

func _on_HurtBox_area_entered(area):
	queue_free()
	item.sword -= 1
	var deathEffect = DeathEffect.instance()
	get_parent().add_child(deathEffect)
	deathEffect.flip_h = velocity.x < 0
	if velocity.x < 0:
		deathEffect.flip_h = velocity.x < 0
		deathEffect.global_position = global_position + Vector2(15,0)
	else:
		deathEffect.global_position = global_position - Vector2(15,0)
