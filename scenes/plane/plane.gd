extends CharacterBody2D

const GRAVITY: float = 650.0
const UP_FORCE: float = -200.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	gravity(delta)
	if is_on_floor() or is_on_ceiling():
		hold_process()
	jump()


func gravity(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	move_and_slide()
	
func jump() -> void:
	if Input.is_action_just_pressed("jump"):
		animation_player.play("UPWARD")
		velocity.y = UP_FORCE
 
func hold_process() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
