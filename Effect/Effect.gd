extends AnimatedSprite

func _ready():
	connect("animation_finished", self, "on_animate_finished")
	play("animate")

func on_animate_finished():
	pass
