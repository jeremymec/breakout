extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity

signal wall_collision(id)

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2()
	velocity.y = 3

func _physics_process(_delta):
	var collision = move_and_collide(velocity)
	if (collision):
		if (collision.collider.name == "Player_KinematicBody2D"):
			velocity.y = velocity.y * -1
			var platform_x = collision.collider.get_position().x
			var offset_x = position.x - platform_x
			#var angle = .005 * offset_x
			#print(angle)
			velocity = velocity.rotated(.1)
		else:
			velocity.y = velocity.y * -1
			emit_signal("wall_collision", collision.collider_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
