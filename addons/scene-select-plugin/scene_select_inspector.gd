@tool
extends EditorInspectorPlugin

var scene_select_property = preload("res://addons/scene-select-plugin/scene_select_property.gd")
var property_instance
var scene_select : SceneSelect

func _can_handle(object : Object):
	#PluginDevHelpers.print_props(object)	
	return true

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_OBJECT && hint_type == PROPERTY_HINT_RESOURCE_TYPE && hint_string == "SceneSelect":
		property_instance = scene_select_property.new(object.get(name), object)
		add_property_editor(name, property_instance)
