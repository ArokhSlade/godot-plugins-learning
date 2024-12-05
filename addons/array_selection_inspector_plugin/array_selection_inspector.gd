@tool
extends EditorInspectorPlugin


var array_property_resource = preload("res://addons/array_selection_inspector_plugin/array_selection_property.gd")
var array_property


func _can_handle(object : Object):
	var class_ = object.get_class()
	#var meta_list = object.get_meta_list()
	#print(object, " : ", meta_list)
	#print(class_)
	if object is Node2D:
		if object.name.begins_with("SceneWith"):
			#print(object.get_property_list())
			print_rich("[color=green][b]***[/b][/color]")
			return true
	return false
	
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	return
	if type == TYPE_ARRAY:
		print("found array")
		#add_property_editor(name, preload("res://addons/array_selection_inspector_plugin/array_select.tscn").instantiate())
		array_property = array_property_resource.new()
		add_property_editor(name, array_property)
		#return true
		
		

func _parse_end(object):
	print_rich("[color=red][b]************[/b][/color]")
