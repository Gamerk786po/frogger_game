extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	$Label2.text = "Score: " + str(Global.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("End")):
		call_deferred("go_to_game")

func go_to_game() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
