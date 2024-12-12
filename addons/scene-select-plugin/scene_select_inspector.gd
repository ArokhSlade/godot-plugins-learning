@tool
extends EditorInspectorPlugin

var scene_select_property = preload("res://addons/scene-select-plugin/scene_select_property.gd")
var property_instance
var scene_select : SceneSelect

func _can_handle(object : Object):
	PluginDevHelpers.print_props(object)
	if object is SceneSelect:
		scene_select = object
	
		return true
	return true

var found_scene_list = false
var scene_list : SceneList

#func _parse_begin(object):
	#if object is SceneSelect:
		#property_instance = scene_select_property.new(object)
		#add_property_editor_for_multiple_properties("scene select",["scene_list","selected_scene"], property_instance)		

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_OBJECT && hint_type == PROPERTY_HINT_RESOURCE_TYPE && hint_string == "SceneSelect":
		property_instance = scene_select_property.new(object.get(name))
		add_property_editor(name, property_instance)
		return false
	#if object is SceneSelect:
		#property_instance = scene_select_property.new(object)
		#add_property_editor(name, property_instance)
		#return false 
	return false
	
