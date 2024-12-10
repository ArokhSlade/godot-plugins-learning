@tool
class_name SceneSelect
extends Resource

var scenes_array : Array[PackedScene] # the possible scenes to choose from
var selected_scene : PackedScene # refers to an element of the associated array
var selection_index : int # index of scene in the associated array

func print():
	print(self, " : ", selected_scene, " : ", selection_index)
