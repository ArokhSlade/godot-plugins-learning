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

var found_scene_list = false
var scene_list : SceneList

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if name == "scene_select.gd" && usage_flags == "PROPERTY_USAGE_CATEGORY":		
		print("found scene_select.gd category")		
	if name == "scene_list":
		print("found scene list")
		found_scene_list = true	
		scene_list = object.get(name)
	if name == "selected_scene" && hint_string == "PackedScene":
		print("scene list: ", scene_list)
		var property = object.get(name)
		#if property == null:
			#property = SceneSelect.new()
		print("Property: ", property)
		property_instance = scene_select_property.new(scene_select, scene_list)
		add_property_editor(name, property_instance)
		#add_property_editor_for_multiple_properties("list and choice",["selected_scene","scene_list","selection_index","fake_property"],property_instance)
		found_scene_list = false
	#if type == TYPE_OBJECT && hint_string == "SceneSelect":
		#var property = object.get(name)
		#print ("object: ", object)		
		#print("property: ", property)
		#
		#property_instance = scene_select_property.new(property)
		#add_property_editor(name, property_instance)		
		#add_property_editor_for_multiple_properties("multiple_things", [name,"options_array"], property_instance)
		#return true #return false / nothing to let godot show default ui in addition to ours
