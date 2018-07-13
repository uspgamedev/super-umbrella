extends KinematicBody2D

var velocity     = Vector2()
const UP         = Vector2(0,-1)
const JMP_STR    = -500
const SPEED      =  150
const GRAVITY    =  2400

func _process(delta):
	var RIGHT = true
	var LEFT  = false
	
	var sprite_sheet= get_child(0)
	var anim_player = get_child(0).get_child(0)
	
	var should_play = ""
	var invert_imgx = sprite_sheet.is_flipped_h()
	
	if is_on_floor():
		if velocity.x < 0:
			should_play = "player_walking"
			invert_imgx = RIGHT
		elif velocity.x > 0:
			should_play = "player_walking"
			invert_imgx = LEFT
		else:
			should_play = "player_idle"	
	else:
		if velocity.y   < 0:#going up
			should_play = "player_jumping"
		elif velocity.y > 0:#going down
			should_play = "player_falling"
	
	sprite_sheet.set_flip_h(invert_imgx) 
	
	if anim_player.get_current_animation() != should_play:
		anim_player.stop(true)
		anim_player.play(should_play)
	pass

func _physics_process(delta):
	
	velocity.y += GRAVITY*delta
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x =-SPEED
	else:
		velocity.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JMP_STR
	velocity = move_and_slide(velocity, UP)