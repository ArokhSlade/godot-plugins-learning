@tool
extends EditorProperty

var scene_list : SceneList
var gui = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate() as SceneSelectUI
var option_button : OptionButton = gui.find_child("OptionButton")

var selected_scene : PackedScene
var current_value : SceneSelect

var updating = false #NOTE(ArokhSlade,2024 12 09) following godot docs guidance here, does not make sense to me

func _init(property : SceneSelect, _scene_list : SceneList):	
	current_value = property
	print("current value: ", current_value)
	print("scene list: ", _scene_list)
	scene_list = _scene_list
	print("current value: ", current_value)
	init_ui()
	
	
func init_ui():
	print("current value: ", current_value)
	print_rich("[color=red]init[/color]")
	
	add_child(gui)
	
	for option in scene_list.names:
		option_button.add_item(option)
	
	option_button.item_selected.connect(on_item_selected)
	
	property_changed.connect(gui.update_ui)	
	
	#gui.res_pick.resource_selected.connect(???)
	emit_changed(get_edited_property(),current_value)
	property_changed.connect(current_value.on_selection_changed)
	
	
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
	
	var new_value : PackedScene = get_edited_object()[get_edited_property()]
	
	updating = true		
	current_value.selected_scene = new_value	
	updating = false
