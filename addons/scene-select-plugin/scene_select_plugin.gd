@tool
extends EditorPlugin

var inspector_plugin = preload("res://addons/scene-select-plugin/scene_select_inspector.gd")
var plugin_instance
var ui_instance = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate()

func _enter_tree():
	plugin_instance = inspector_plugin.new()	
	add_inspector_plugin(plugin_instance)	
var node_count = 0
func on_node_added(node:Node):
	print("node added: %d : " % node_count, node)
	node_count += 1


func _exit_tree():
	remove_inspector_plugin(plugin_instance)
