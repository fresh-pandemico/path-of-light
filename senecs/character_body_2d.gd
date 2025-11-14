extends CharacterBody2D

class_name player
const SPEED = 500.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var run_multiplaier = 1
	
	if Input.is_action_pressed("run"):
	
		run_multiplaier = 2
	else:
		run_multiplaier = 1
	
	
	var direction := Input.get_axis("RIGHT", "LEFT")
	if direction:
		velocity.x = direction * SPEED * run_multiplaier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * run_multiplaier)

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		
	if velocity.x > 0: 
		$AnimatedSprite2D.flip_h = false
		

	if velocity.x != 0:
		$AnimatedSprite2D.play("walk")
	else: 
		$AnimatedSprite2D.play("idel")




	move_and_slide()





func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://senecs/world.tscn")
