@tool
extends Node2D


@export var scene : SceneSelect :
	set(value):
		scene = value
		if scene:
			print_rich("[color=green]setting scene %s to %s[/color]" %[scene.selected_scene, value.selected_scene])
			set("selected_scene", value.selected_scene)
			update_instance()
			notify_property_list_changed() #TODO: check if necessary
			queue_redraw() #TODO: check if necessary
			if not scene.selection_changed.is_connected(on_scene_selection_changed):
				scene.selection_changed.connect(on_scene_selection_changed)


var scene_instance

func update_instance():	
	print("(%s)update_instance" % Time.get_time_string_from_system())	
	if scene_instance!=null && !scene_instance.is_queued_for_deletion(): 		
		scene_instance.queue_free()
		scene_instance = null
	if scene && scene.selected_scene != null:
		scene_instance = scene.selected_scene.instantiate()
		add_child(scene_instance)


func _ready():
	update_instance()


func on_scene_selection_changed():
	print(self)
	print("(%s)on_scene_selection_changed: signal received!" % Time.get_time_string_from_system())
	update_instance()


func on_scene_list_changed():
	print("(%s)on_scne_list_changed: signal received!" % Time.get_time_string_from_system())
	update_instance()
