extends EditorInspectorPlugin

var RandomIntEditor = preload("res://addons/my_inspector_plugin/random_int_editor.gd")

func _can_handle(object) -> bool:		
	if object.has_method("clicked"):
		print(object.to_string())
		return true
		
	return false

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
		
	if type == TYPE_INT:
		print("name : " + name)
		add_property_editor(name, RandomIntEditor.new(),false, name)
		return true
	else :
		return false
		
func _init():
	pass
