@tool
extends EditorInspectorPlugin

var scene_select_property = preload("res://addons/scene-select-plugin/scene_select_property.gd")
var property_instance


func _can_handle(object : Object):
	return true


func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_OBJECT && hint_string == "SceneSelect":
		var property = object.get(name)
		print ("object: ", object)		
		print("property: ", property)
		
		property_instance = scene_select_property.new(property)
		#add_property_editor(name, property_instance)		
		add_property_editor_for_multiple_properties("multiple_things", [name,"options_array"], property_instance)
		return true #return false / nothing to let godot show default ui in addition to ours
