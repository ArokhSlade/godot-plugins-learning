@tool
extends EditorProperty

var resource_instance = preload("res://addons/enemy_picker_plugin/enemy_list.gd").new()
var ui_instance = preload("res://addons/enemy_picker_plugin/enemy_picker_ui.tscn").instantiate()

var current_selection : int
var selected_enemy

func _init():
	print("property initalized")
	init_ui()
	
	
func init_ui():
	add_child(ui_instance)
	#assign options from resource	
	for option in resource_instance.values:
		ui_instance.add_item(option)
		print("option added:" + option)
	
	ui_instance.item_selected.connect(on_item_selected)
	
func on_item_selected(value):
	print("selected: " + str(value))
	current_selection = value
	selected_enemy = get_enemy_for_index(value)
	print("enemey selected:" + selected_enemy)
	emit_changed(get_edited_property(),selected_enemy)
	
func get_enemy_for_index(index : int):
	return resource_instance.values[index]
	
func _update_property():
	#todo
	pass
	
