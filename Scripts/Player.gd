extends KinematicBody2D

export var starting_speed = 8
var speed: int

var velocity = Vector2()
var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = starting_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if (!can_move):
		return
	
	var paddle_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		paddle_velocity.x = 1
	elif Input.is_action_pressed("move_left"):
		paddle_velocity.x = -1
	else:
		paddle_velocity.x = 0
		
	if paddle_velocity.length() > 0:
		paddle_velocity = paddle_velocity.normalized() * speed
		#$AnimatedSprite.play()
		#$AnimatedSprite.animation = "walk"
	else:
		pass
		#$AnimatedSprite.animation = "default"
		#$AnimatedSprite.stop()
	
	move_and_collide(paddle_velocity)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
