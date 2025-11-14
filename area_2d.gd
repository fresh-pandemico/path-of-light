extends Area2D

var speed = 1500
var velocity
var playerOpjaect
var direction = 1

func _ready() -> void:
	playerOpjaect = get_node("../player").get_node("AnimatedSprite2D")
	$Timer.connect("timeout", _on_timer_timeout)

func _process(delta: float) -> void:
	if direction == 1:
		velocity = Vector2(-1, 0).rotated(rotation_degrees) * speed * delta
		$magic/CPUParticles2D.gravity.x = 3000
	else:
		velocity = Vector2(-1, 0).rotated(rotation_degrees) * speed * delta
		$magic/CPUParticles2D.gravity.x = -3000
	position += velocity


func _on_timer_timeout():
	queue_free()
