extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var current_win_size = OS.get_window_size()
	OS.set_window_size(Vector2(2,2)*current_win_size)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
