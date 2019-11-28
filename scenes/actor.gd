extends KinematicBody2D

# Declare member variables here. Examples:


var mouseIn = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# You need to create a action caleld "click"(Left mouse click) in the project input map.
	# Você precisa criar uma ação chamada click(botão esquerdo do mouse) no input map do seu projeto
#	if(mouseIn && Input.is_action_pressed("click")):
#		position = get_viewport().get_mouse_position()
	pass


func _on_KinematicBody2D_mouse_entered():
	mouseIn = true
	print_debug("inside")
	pass # Replace with function body.



func _on_KinematicBody2D_mouse_exited():
	mouseIn = false
	pass # Replace with function body.
