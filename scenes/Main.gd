extends Node2D

var score = 0  # Initialize score
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sceneUI=get_node("Control")
onready var scoreText = sceneUI.get_node("score")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func update_score(points):
	score += points
	scoreText.text = "Score: " + str(score)
