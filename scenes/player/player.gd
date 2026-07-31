extends CharacterBody2D

var direction: Vector2 = Vector2(0, 0);
var speed: int = 150
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	animation()
	velocity = direction * speed
	move_and_slide()

func animation() -> void:
	# When direction is true => means user is constantly trying to move
	if direction:
		# Fling depends on the direction of x axis, when x is negative
		# user move left and when x is positive user moves right
		$AnimatedSprite2D.flip_h = (direction.x > 0)
		if direction.x != 0:
			$AnimatedSprite2D.animation = "horizontal"
		else:
			if direction.y != 0:
				$AnimatedSprite2D.animation = "down" if direction.y > 0 else "up"
	else:
		$AnimatedSprite2D.frame = 0
