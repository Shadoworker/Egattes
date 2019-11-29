extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SCORE_LENGTH = 4  
var SCORE = 0
onready var score = get_node("../score/score")

onready var actor = get_node("../actor")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Area2D_body_exited(body):
#	print_debug(body.name)
	if body.name != "actor" :
		
		actor.set("billes" , (actor.get("billes") - 1) )		
		var current_score_str = score.text
		var current_score_int = int( current_score_str )
						
						 
		current_score_int += 5
						 
		var new_current_score_str = str(current_score_int).pad_zeros(SCORE_LENGTH)
						
	#	print(new_current_score_str)
		#Update score as internal and external(ui) data
		SCORE = current_score_int
						
		score.text = new_current_score_str
			
	pass # Replace with function body.
