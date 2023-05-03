extends Area2D

@export var Name = "item"

func _ready():
	pass

func _on_Item_body_entered(body):
	if body.is_in_group("player"):
		pick_up()
		queue_free()

func pick_up():
	# TODO: Handle what happens when the player picks up the item
	pass
