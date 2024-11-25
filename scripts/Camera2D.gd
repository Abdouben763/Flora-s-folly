extends Camera2D
var animation_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = $AnimationPlayer

# Function to play the animation.
func play_camera_animation():
	$AnimationPlayer.play("camera_intro")


