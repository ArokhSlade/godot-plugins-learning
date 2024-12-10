@tool
extends EditorProperty

var scene_list : SceneList
var gui = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate() as SceneSelectUI
var option_button : OptionButton = gui.find_child("OptionButton")

var selected_enemy : PackedScene
var current_value : SceneSelect

var updating = false #NOTE(ArokhSlade,2024 12 09) following godot docs guidance here, does not make sense to me


func _init(property : SceneSelect):
	current_value = property
	init_ui()
	
	
func init_ui():
	print_rich("[color=red]init[/color]")
	
	add_child(gui)
	
	#for option in scene_list.names:
		#option_button.add_item(option)
	
	option_button.item_selected.connect(on_item_selected)
	
	property_changed.connect(gui.update_ui)	
	
	#gui.res_pick.resource_selected.connect(???)
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
	pass
	#var new_value : SceneSelect = get_edited_object()[get_edited_property()]
	#
	#updating = true	
	#current_value = new_value
	#updating = false
