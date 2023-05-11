extends Node2D

const MAX_ITEMS = 3

var items = []

func add_item(item):
	if items.size() < MAX_ITEMS:
		items.append(item)
		update_icons()

func remove_item(index):
	if index < items.size():
		items.remove(index)
		update_icons()

func update_icons():
	$ItemIcons.clear()
	for item in items:
		var icon = load(item.icon_path)
		var texture = icon.get_texture()
		var sprite = Sprite2D.new()
		sprite.texture = texture
		$ItemIcons.add_child(sprite)
