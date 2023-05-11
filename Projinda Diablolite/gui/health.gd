extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Health.health == 3:
		$ProgressBar.value = 100
	if Health.health == 2.5:
		$ProgressBar.value = 84
	if Health.health == 2:
		$ProgressBar.value = 66
	if Health.health == 1.5:
		$ProgressBar.value = 50
	if Health.health == 1:
		$ProgressBar.value = 33
	if Health.health == 0.5:
		$ProgressBar.value = 17
	if Health.health == 0:
		$ProgressBar.value = 0
