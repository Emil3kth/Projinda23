extends Area2D

#func _on_body_entered(body):
#	if body.name == "Player":
#		queue_free()

@export var icon_path: String
@export var use_script: Script

func _ready():
	$CollisionShape2D.set_deferred("disabled", false)

func _on_body_entered(body):
	if body.name == "Player":
		var player = body.get_node("/root/World/Player")
		get_node("/root/World/Player/UserInterface/Hotbar/TextureRect/Sword").show()
		queue_free()
