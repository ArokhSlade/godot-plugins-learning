@tool
extends EditorInspectorPlugin

var scene_select_property = preload("res://addons/scene-select-plugin/scene_select_property.gd")
var property_instance
var scene_select : SceneSelect

func _can_handle(object : Object):
	#PluginDevHelpers.print_props(object)
	if object is SceneSelect:
		scene_select = object	
		return true
	return false

func _parse_begin(object):
	assert(object is SceneSelect)
	property_instance = scene_select_property.new(object)
	add_property_editor_for_multiple_properties("scene select",["scene_list","selected_scene"], property_instance)
