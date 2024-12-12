@tool
class_name SceneSelect
extends Resource

signal selection_changed
signal scene_list_changed

@export var scene_list : SceneList : 
	set(value):
		scene_list = value
		if scene_list != null:
			scene_list.scenes_set.connect(on_scenes_set)
		
@export var selected_scene : PackedScene # refers to an element of the associated array
var selection_index : int # index of scene in the associated array


func on_selection_changed(property: StringName, value: Variant, field: StringName, changing: bool):
	selection_changed.emit()

func on_scenes_set():
	scene_list_changed.emit()
	

func print():
	print(self, " : ", scene_list, " : ", selected_scene, " : ", selection_index)

func _validate_property(property):
	if property.name == "selected_scene":
		property.usage |= PROPERTY_USAGE_READ_ONLY
