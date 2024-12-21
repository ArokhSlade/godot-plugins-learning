@tool
extends Node

var all_scene_selects : Array[SceneSelect]

func test() -> String:
	return "the registry exists (%d entries)" % all_scene_selects.size()
	

func visualize_all_scenes():
	for resource in all_scene_selects:
		# i thought we could get to the resource's "owning node"
		# but it seems i was wrong. use the tree root as a stand-in
		var owning_node = Engine.get_main_loop().edited_scene_root
		resource.visualize(owning_node)
