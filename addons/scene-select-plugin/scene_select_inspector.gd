@tool
extends EditorInspectorPlugin

var scene_select_property = preload("res://addons/scene-select-plugin/scene_select_property.gd")
var scene_select_property_4 = preload("res://addons/scene-select-plugin/scene_select_property_4.gd")
var scene_select_property_5 = preload("res://addons/scene-select-plugin/scene_select_property_5.gd")
var property_instance
var scene_select : SceneSelect

func _can_handle(object : Object):
	PluginDevHelpers.print_props(object)	
	if object is SceneSelect:		
		return true
	return true

func _parse_begin(object : Object):
	if object is SceneSelect:
		property_instance = scene_select_property.new(object)
		add_property_editor("SceneSelect", property_instance)
		
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_OBJECT && hint_type == PROPERTY_HINT_RESOURCE_TYPE && hint_string == "SceneSelect4":
		print("FOUND version 4")
		property_instance = scene_select_property_4.new(object.get(name), object)
		add_property_editor(name, property_instance)	
	if type == TYPE_OBJECT && hint_string == "SceneSelect":
		print("FOUND SceneSelect as property, making Ver.5 editor")
		property_instance = scene_select_property_5.new(object.get(name), object)
		add_property_editor(name, property_instance)		
	pass 
