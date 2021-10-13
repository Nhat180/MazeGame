extends KinematicBody2D


export var SPEED = 120
export var ACCEL = 450
export var FRICTION = 450

#Types of action of player
enum {
	MOVE,
	ATTACK
}

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var hitboxCollision = $HitBoxPivot/Hitbox/CollisionShape2D

var item = ItemStats
var screenSize
var state = MOVE
var velocity = Vector2.ZERO

func _ready():
	screenSize = get_viewport_rect().size
	animationTree.active = true
	hitboxCollision.disabled = true

#Handle the physic process of player
func _physics_process(delta):
	match state:
		MOVE:
			moveState(delta)
		
		ATTACK:
			attackState()
	
	

# Move state, handle the sprite movement
func moveState(delta):
	var vector = Vector2.ZERO
	vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vector = vector.normalized()
	
	if vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", vector)
		animationTree.set("parameters/Walk/blend_position", vector)
		animationTree.set("parameters/Attack/blend_position", vector)
		animationState.travel("Walk")
		velocity = velocity.move_toward(vector * SPEED, ACCEL * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	#Ensure the player stays in the playing screen
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y - 80)
	
	velocity = move_and_slide(velocity) 
	
	if item.sword >= 1:
		hitboxCollision.disabled = false
	else:
		hitboxCollision.disabled = true

# Attack state, handle sprite attack
func attackState():
	velocity = move_and_slide(Vector2.ZERO)
	animationState.travel("Attack")

# Ensure player will change from attack to move state after finishing the attack animation sprite
func attack_animation_finished():
	state = MOVE

# Detect the enemy in attack range and give order to player to change from move to attack state 
func _on_Hitbox_area_entered(area):
	state = ATTACK
