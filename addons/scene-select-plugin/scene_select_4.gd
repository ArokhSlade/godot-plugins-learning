@tool
class_name SceneSelect4
extends Resource

signal selection_changed
signal scene_list_changed

@export var scene_list : SceneList : 
	set(value):
		print("scene list set from ", scene_list, " to ", value)
		scene_list = value
		if scene_list != null:
			scene_list.scenes_set.connect(on_scenes_set)		
		
@export var selected_scene : PackedScene : # refers to an element of the associated array
	set(value):
		print("selected scene set from ", selected_scene, " to ", value)
		if (value != null):
			selected_scene = value
			call_deferred("visualize")

var selected_index : int = -1
var scene_instance : Node
var owner : Node

#var call_after_setters_are_done : bool :
	#set(value)

func on_selection_changed(property: StringName, value: Variant, field: StringName, changing: bool):
	print("selection_changed")	
	selection_changed.emit()
	visualize()

func _init():
	print_me()		
	

func visualize():
	print_rich("[color=purple]VISUALIZE[/color]")
	print_me()
	if owner == null:
		print_rich("[color=red]cannot visualize selected scene : owner is <null>[/color]")
		return
		
	if scene_instance!=null && !scene_instance.is_queued_for_deletion(): 
		print("freeing old scene")
		scene_instance.queue_free()
		scene_instance = null
	if selected_scene != null:
		print("initing new scene")
		scene_instance = selected_scene.instantiate()
		owner.add_child(scene_instance)
		#scene_instance.owner = owner
		#scene_instance.owner = Engine.get_main_loop().edited_scene_root


func on_scenes_set():
	scene_list_changed.emit()
	

func print_me():
	print(self, " : ", scene_list, " : ", selected_scene, " : ", selected_index, " : ", owner)
	


func _validate_property(property):
	if property.name == "selected_scene":
		property.usage |= PROPERTY_USAGE_READ_ONLY
	if property.name == "selected_index":
		property.usage |= PROPERTY_USAGE_STORAGE
	if property.name == "owner":
		property.usage |= PROPERTY_USAGE_STORAGE | PROPERTY_USAGE_SCRIPT_VARIABLE
