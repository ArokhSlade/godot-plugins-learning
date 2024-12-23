@tool
extends EditorInspectorPlugin

var scene_select_property = preload("res://addons/scene-select-plugin/scene_select_property.gd")
var property_instance
var scene_select : SceneSelect

func _can_handle(object : Object):
	#PluginDevHelpers.print_props(object)	
	if object is SceneSelect:		
		return true
	return false

func _parse_begin(object : Object):
	if object is SceneSelect:
		property_instance = scene_select_property.new(object)
		add_property_editor("SceneSelect", property_instance)
