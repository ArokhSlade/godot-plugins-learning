@tool
class_name SceneSelect
extends Resource

signal selection_changed

@export var scene_list : SceneList
@export var selected_scene : PackedScene # refers to an element of the associated array
@export var selection_index : int # index of scene in the associated array

func on_selection_changed(property: StringName, value: Variant, field: StringName, changing: bool):
	selection_changed.emit()

func print():
	print(self, " : ", scene_list, " : ", selected_scene, " : ", selection_index)
