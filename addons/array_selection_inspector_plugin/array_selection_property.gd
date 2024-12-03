extends EditorProperty

var gui_scene : PackedScene = preload("res://addons/array_selection_inspector_plugin/array_select.tscn")

func _init():
	pass

func _ready():
	var control = gui_scene.instantiate()
	#var control = Button.new()
	get_parent_control().add_child(control)
	add_focusable(control)
	var parent = get_parent()
	var parent_control = get_parent_control()
	while(parent):
		print(parent.get_property_list())
		parent = parent.get_parent()
	
