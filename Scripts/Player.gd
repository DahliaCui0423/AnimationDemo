extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var HitBoxCollision = $HitBoxPivot/SwordHitBox/CollisionShape2D

enum {
	MOVE,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
export var max_speed = 150

func _ready():
	animationTree.active = true
	HitBoxCollision.disabled = true

func _physics_process(delta):
	match state:
		MOVE:
			state_move(delta)
		ATTACK:
			state_attack(delta)

# I did the assignemnt wrong. I thought the player need to control the character.
func state_move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = input_vector * max_speed
	else:
		#animationState.travel("Idle")
		velocity = Vector2.ZERO
	
	move_and_collide(velocity * delta)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func state_attack(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func attack_animation_finished():
	state = MOVE
	
func left_run_anim():
	animationPlayer.play("RunLeft")
	
func left_idle_anim():
	animationPlayer.play("IdleLeft")
	
func up_run_anim():
	animationPlayer.play("RunUp")
	
func up_idle_anim():
	animationPlayer.play("IdleUp")

func down_run_anim():
	animationPlayer.play("Run")
	
func down_idle_anim():
	animationPlayer.play("Idle")

func left_attack_anim():
	animationPlayer.play("AttackLeft")
	
func right_run_anim():
	animationPlayer.play("RunRight")
