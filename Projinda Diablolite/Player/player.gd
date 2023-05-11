extends CharacterBody2D

@export var maxHealth = 3
@onready var currentHealth: int = maxHealth

@export var speed = 5
var moving = false
var tile_size = 16
var inputs = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN
}

var last_dir = Vector2.DOWN

@onready var ray = $RayCast2D
@onready var animation_player = $AnimationPlayer
var currentHealth: int = 10
var hotbar
const HOTBAR_SIZE = 3
var hotbar_items = []
var hotbar_selection = 0

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2
	animation_player.play("idle_down")

func _physics_process(_delta):
	if !moving:
		for dir in inputs.keys():
			if Input.is_action_pressed(dir):
				move(dir)
				break
	if !moving:
		var anim_name = get_idle_animation_name()
		animation_player.play(anim_name)

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/speed).set_trans(Tween.TRANS_SINE)
		moving = true
		last_dir = inputs[dir]
		var anim_name = get_animation_name("walk", last_dir)
		animation_player.play(anim_name)
		await tween.finished
		moving = false


func get_animation_name(prefix, dir):
	var anim_name = prefix + "_"
	if dir.x > 0:
		anim_name += "right"
	elif dir.x < 0:
		anim_name += "left"
	elif dir.y < 0:
		anim_name += "up"
	elif dir.y > 0:
		anim_name += "down"
	else:
		anim_name = prefix
	return anim_name


func get_idle_animation_name():
	var anim_name = "idle"
	if last_dir != Vector2.ZERO:
		anim_name = get_animation_name("idle", last_dir)
	return anim_name


func _on_hurt_box_area_entered(area):
	if area.name == "hitBox":
		currentHealth -= 1
		if currentHealth < 0:
			currentHealth = maxHealth
		print_debug(currentHealth)
			
			
			
		
	
