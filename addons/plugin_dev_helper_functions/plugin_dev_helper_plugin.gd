@tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("PluginDevHelpers", "res://addons/plugin_dev_helper_functions/plugin_dev_helper_functions.gd")

func _exit_tree():
	remove_autoload_singleton("PluginDevHelpers")
	
