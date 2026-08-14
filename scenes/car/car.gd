extends Area2D

var colors = [
	preload("res://assets/graphics/cars/green.png"),
	preload("res://assets/graphics/cars/yellow.png")
]
var direction: Vector2 = Vector2.ZERO
var speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if position.x > 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT
		$Sprite2D.flip_h = true		
	$Sprite2D.texture = colors.pick_random()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
