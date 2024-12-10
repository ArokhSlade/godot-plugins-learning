@tool
extends EditorProperty

var scene_list : SceneList
var ui_instance = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate()
var option_button : OptionButton = ui_instance.find_child("OptionButton")

var selected_enemy : PackedScene
var current_value : SceneSelect

var updating = false #NOTE(ArokhSlade,2024 12 09) following godot docs guidance here, does not make sense to me


func _init(object):
	current_value = object
	if current_value:
		current_value.print()
	init_ui()
	
	
func init_ui():
	print_rich("[color=red]init[/color]")
	
	add_child(ui_instance)
	
	for option in scene_list.names:
		option_button.add_item(option)
	
	option_button.item_selected.connect(on_item_selected)
	
	property_changed.connect(ui_instance.update_ui)	
	emit_changed(get_edited_property(),current_value)
	
	
func on_item_selected(value):
	if updating:
		return
	
	selected_enemy = get_enemy_for_index(value)		
	current_value = SceneSelect.new() # TODO: dont't reallocate
	current_value.enemy_scene = selected_enemy
	current_value.scene_index = value
	emit_changed(get_edited_property(),current_value)


func get_enemy_for_index(index : int):
	return scene_list.scenes[index]


func _update_property():	
	var new_value : SceneSelect = get_edited_object()[get_edited_property()]
	
	updating = true	
	current_value = new_value
	updating = false
