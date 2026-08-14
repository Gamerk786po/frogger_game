extends Node2D

# Variable for Score
var score:int 
# Preloading car_scene
var car_scene: PackedScene = preload("res://scenes/car/car.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Car Spawning
func _on_car_timer_timeout() -> void:
	# Getting car instantiated
	var car = car_scene.instantiate() as Area2D
	# Getting car as a child
	var marker = $car_spawning_postions.get_children().pick_random()
	car.position = marker.position
	$cars.add_child(car)
	car.connect("body_entered", player_collided)

# Go to title when player collide with the car
func player_collided(_body) -> void :
	call_deferred("go_to_title")
	Global.score = score
	

func go_to_title() -> void:
	get_tree().change_scene_to_file("res://scenes/Title/title.tscn")

# Updating score
func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = str(score)
