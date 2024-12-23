@tool
extends EditorProperty

var gui = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate() as SceneSelectUI
var option_button : OptionButton = gui.find_child("OptionButton")

var current_value : SceneSelect
var scene_list : SceneList
var scene_instance : Node # for Editor respresentation
var owning_node : Node
var updating = false #NOTE(ArokhSlade,2024 12 09) following godot docs guidance here, does not make sense to me

func _init(scene_select : SceneSelect, object : Node): 
	print_rich("[color=yellow]init property[/color]")	
	current_value = scene_select
	owning_node = object
	print("edited object: ", get_edited_object())

	scene_list = current_value.scene_list	
	print(current_value.print_me())
	init_ui()
	property_changed.connect(current_value.on_selection_changed)
	emit_changed(get_edited_property(),current_value)


func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		print_rich("[color=yellow]freeing property...[/color]")


func init_ui():	
	gui.initialize_list(scene_list)
	add_child(gui)	
	for option in scene_list.names:
		option_button.add_item(option)	
	option_button.item_selected.connect(on_item_selected)	
		
	
func on_item_selected(index):	
	print_rich("[color=green]start select[/color]")	
	current_value.selected_index = index	
	current_value.selected_scene = current_value.scene_list.scenes[current_value.selected_index]	
	emit_changed(get_edited_property(),current_value)
	print_rich("[color=green]end select[/color]")


func get_scene_for_index(index : int):
	return scene_list.scenes[index]


func _update_property():
	print_rich("[color=red]start updating[/color]")	
	print("current_value ", current_value.selected_index)
	
	#if scene_instance!=null && !scene_instance.is_queued_for_deletion(): 
		#scene_instance.queue_free()
		#scene_instance = null
	#if current_value.selected_scene != null:
		#scene_instance = current_value.selected_scene.instantiate()
		#add_child(scene_instance)
	
	gui.update_ui_simple(current_value.selected_index)
	print("edited object: ", get_edited_object())
	print_rich("[color=red]done updating[/color]")
		
