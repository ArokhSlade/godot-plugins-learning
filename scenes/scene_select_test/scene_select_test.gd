@tool
extends Node2D


@export var scene : SceneSelect :
	set(value):
		scene = value
		
		if scene:
			print("is_inside_tree: ",is_inside_tree())
			print_rich("[color=green]setting scene %s to %s[/color]" %[scene.selected_scene, value.selected_scene])			
			
			notify_property_list_changed() #TODO: check if necessary
			queue_redraw() #TODO: check if necessary
			if not scene.selection_changed.is_connected(on_scene_selection_changed):
				scene.selection_changed.connect(on_scene_selection_changed)
			scene.emit_changed()

var scene_instance

func update_instance():
	pass

func on_scene_selection_changed():
	print(self, " : (%s)on_scene_selection_changed: signal received!" % Time.get_time_string_from_system())
	update_instance()

func on_scene_list_changed():
	print("(%s)on_scne_list_changed: signal received!" % Time.get_time_string_from_system())
	update_instance()
