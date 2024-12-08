@tool
extends EditorPlugin

var plugin


func _enter_tree():
	plugin = preload("res://addons/ref_prop_plugin/ref_prop_insp.gd").new()
	add_inspector_plugin(plugin)


func _exit_tree():
	remove_inspector_plugin(plugin)
