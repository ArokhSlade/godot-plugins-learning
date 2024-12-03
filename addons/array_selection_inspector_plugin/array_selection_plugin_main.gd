@tool
extends EditorPlugin

var plugin_resource = preload("res://addons/array_selection_inspector_plugin/array_selection_inspector.gd")
var the_plugin : EditorInspectorPlugin

func _enter_tree():
	the_plugin = plugin_resource.new()
	add_inspector_plugin(the_plugin)


func _exit_tree():
	remove_inspector_plugin(the_plugin)
