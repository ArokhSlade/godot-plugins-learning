extends EditorInspectorPlugin

var RandomIntEditor = preload("res://addons/ref_prop_plugin/random_int_editor.gd")


func _can_handle(object):
	# We support all objects in this example.
	return true


func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	# We handle properties of type integer.
	if type == TYPE_INT:
		# Create an instance of the custom property editor and register
		# it to a specific property path.
		print("add prop ed...")
		add_property_editor(name, RandomIntEditor.new())
		# Inform the editor to remove the default property editor for
		# this property type.
		return true
	else:
		return false
