@tool
extends EditorProperty

var gui = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate() as SceneSelectUI
var option_button : OptionButton = gui.find_child("OptionButton")

var current_value : SceneSelect
var scene_list : SceneList
var selected_scene : PackedScene

var updating = false #NOTE(ArokhSlade,2024 12 09) following godot docs guidance here, does not make sense to me

func _init(scene_select : SceneSelect):		
	current_value = scene_select
	scene_list = current_value.scene_list	
	init_ui()
	
	
func init_ui():
	add_child(gui)
	
	for option in scene_list.names:
		option_button.add_item(option)
	
	option_button.item_selected.connect(on_item_selected)
	
	property_changed.connect(gui.update_ui)	
	property_changed.connect(current_value.on_selection_changed)
		
	emit_changed(get_edited_property(),current_value)
	
	
func on_item_selected(value):
	if updating:
		return
	
	selected_scene = get_scene_for_index(value)
	print("current value: ", current_value)
	current_value.selected_scene = selected_scene
	current_value.selection_index = value
	emit_changed(get_edited_property(),current_value)


func get_scene_for_index(index : int):
	return scene_list.scenes[index]


func _update_property():
	print("_update_property")
	
	#var new_value = get_edited_object()[get_edited_property()]
	#
	#print(new_value)
	#
	#updating = true		
	#current_value.selected_scene = new_value	
	#updating = false
	pass
