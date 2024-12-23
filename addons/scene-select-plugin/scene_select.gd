@tool
class_name SceneSelect
extends Node2D

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
			call_deferred("update_visual")

var selected_index : int = -1
		
var scene_instance : Node


func update_visual():		
	scene_instance = selected_scene.instantiate()
	var user_node = get_parent()
	user_node.add_child(scene_instance) 




func on_selection_changed(property: StringName, value: Variant, field: StringName, changing: bool):
	print("selection_changed")	
	selection_changed.emit()

func _init():	
	print_me()
	

func visualize(owning_node:Node):
	if scene_instance!=null && !scene_instance.is_queued_for_deletion(): 		
		scene_instance.queue_free()
		scene_instance = null
	if selected_scene != null:
		scene_instance = selected_scene.instantiate()
		owning_node.add_child(scene_instance)


func on_scenes_set():
	scene_list_changed.emit()
	

func print_me():
	print(self, " : ", scene_list, " : ", selected_scene, " : ", selected_index)
	


func _validate_property(property):
	if property.name == "selected_scene":
		property.usage |= PROPERTY_USAGE_READ_ONLY
	if property.name == "selected_index":
		property.usage |= PROPERTY_USAGE_STORAGE
