@tool
class_name SceneSelect
extends Resource

@export var scene_list : SceneList
@export var selected_scene : PackedScene # refers to an element of the associated array
@export var selection_index : int # index of scene in the associated array

func print():
	print(self, " : ", scene_list, " : ", selected_scene, " : ", selection_index)
