extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var initPos = Vector2(292 , 840)

onready var actor = get_node("actor")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	actor.set_position(initPos)
		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

