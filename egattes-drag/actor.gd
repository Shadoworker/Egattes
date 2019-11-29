extends KinematicBody2D

onready var tween = get_node("tween")

export var billes : int = 6

var lapse = 0
var mouseIn = false
var launched = false

var initPos = Vector2(292 , 840)
var motion = Vector2()

var speed = 0.4

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	billes = 6
	lapse += 1
	pass

func _process(delta):
	# You need to create a action caleld "click"(Left mouse click) in the project input map.
	# Você precisa criar uma ação chamada click(botão esquerdo do mouse) no input map do seu projeto
	if(mouseIn && Input.is_action_pressed("click")):
		set_position(get_viewport().get_mouse_position())
		motion = get_viewport().get_mouse_position()
	if launched :
		var propulsion = motion - initPos
		if propulsion.y < 0 :
			propulsion.y = 50
		
		propulsion.x = -propulsion.x
		propulsion.y = -propulsion.y
#		CHECK IF GOES UP 
		if propulsion.y < -60:
			$actorCollision.disabled = true
#			print_debug("dis")
		else:
			$actorCollision.disabled = false
							
		move_and_collide(propulsion * speed)
		
	 
		
		
	pass


#func _on_Area2D_mouse_entered():
#	mouseIn = true
#	pass # replace with function body
#
#
#func _on_Area2D_mouse_exited():
#	mouseIn = false
##	print_debug("launched")
#	pass # replace with function body


func _on_Button_button_down():
	mouseIn = true
	launched = false
#	print_debug("pinched")
	pass # Replace with function body.


func _on_Button_button_up():
	mouseIn = false
	launched = true
#	print_debug("launched")
	
	
	tween.interpolate_property($"." , "scale" , Vector2(1 , 1) , Vector2(0.45 , 0.45) , 2 , Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

	pass # Replace with function body.



func _on_VisibilityNotifier2D_screen_exited():
	launched = false
	lapse += 1
	
	if lapse < 4:
		
#		IF NOT ALL BALLS REACHED
		if billes > 0:
			set_position(initPos)
			set_scale(Vector2(1 , 1))
			tween.stop($".")
		
#		IF ALL BALLS REACHED
		if billes == 0:
			#GOTO REPLAY SCENE
			get_tree().change_scene("res://GameOver.tscn")

	else:
		
#		GOTO MENU SCENE
		get_tree().change_scene("res://Menu.tscn")

	
	
	pass # Replace with function body.
