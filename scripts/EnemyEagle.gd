extends KinematicBody2D


export var speed = 100 

var target_position = Vector2(0,0)  # Use this variable


onready var player = get_parent().get_node("Main/player")

func _physics_process(delta):
	
	##########################
	#  Write your code here  #
	##########################
	target_position=(player.position-position).normalized()
	
	
	if position.distance_to(player.position)>3:
		move_and_slide(target_position * speed)
		look_at(player.position)
	
	
	if position.x < player.position.x:
		$Sprite.flip_v = false
	else:
		$Sprite.flip_v = true

	if player.dead:
		queue_free()

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		body.queue_free()
		queue_free()
	elif "player" in body.name:
		body.takedmg()
		queue_free()
	var main_scene = get_tree().get_nodes_in_group("Main")[0]  # Find main scene
	if main_scene:
		main_scene.update_score(10)  # Increase score by 10 points
