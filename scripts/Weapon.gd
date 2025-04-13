extends Sprite


#####################################################
#	 		Write the code so that would:			#
#	1. Rotate the wizard's staff to aim at mouse	#
#	2. Shoot the bullet towards mouse				#
#	3. Rotate the bullet toward the mouse direction #
#####################################################


var bullet_speed = 400
var bullet = preload("res://Scenes/Fireball.tscn")
onready var player = get_parent()


func _physics_process(delta):
	if !player.dead:
		look_at(get_global_mouse_position())
		if Input.is_action_just_pressed("Shoot") :
			fire()
	else:
		queue_free()
	
func fire():
	var b = bullet.instance()
	b.position = get_node("firePosition").get_global_position()
	b.rotation_degrees = rotation_degrees
	b.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",b)

