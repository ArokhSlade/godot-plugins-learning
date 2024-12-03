extends EditorProperty

var gui_scene : PackedScene = preload("res://addons/array_selection_inspector_plugin/array_select.tscn")

func _init():
	var control = gui_scene.instantiate()
	add_child(control)
	#var control = Button.new()
	add_child(control)
	add_focusable(control)
