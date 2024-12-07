@tool
extends EditorInspectorPlugin

var enemy_picker_property = preload("res://addons/enemy_picker_plugin/enemy_picker_property.gd")
var property_instance

func _can_handle(object : Object):
	return true
	
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_OBJECT && hint_type == PROPERTY_HINT_RESOURCE_TYPE:
		print("property parsed")
		property_instance = enemy_picker_property.new()
		add_property_editor(name, property_instance)
		#print_stuff(object, type, name, hint_type, hint_string, usage_flags, wide)
		print_properties(object)
		
func print_properties(object : Object):
	for property in object.get_property_list():
		print(property)
	print_rich("[color=green]*******[/color]")
		
func print_stuff(object, type, name, hint_type, hint_string, usage_flags, wide):
	print(object)
	print(type)
	print(name)
	print(hint_type)
	print(hint_string)
	print(usage_flags)
	print(wide)
	print_rich("[color=red]*******[/color]")
		
