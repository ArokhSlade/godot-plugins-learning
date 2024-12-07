@tool
extends EditorPlugin

var inspector_plugin = preload("res://addons/enemy_picker_plugin/enemy_picker_inspector_plugin.gd")
var plugin_instance


func _enable_plugin():
	add_autoload_singleton("GlobalEnemyList", "res://scenes/enemy_list.tscn")

func _enter_tree():
	plugin_instance = inspector_plugin.new()
	add_inspector_plugin(plugin_instance)

func _exit_tree():
	remove_inspector_plugin(plugin_instance)
