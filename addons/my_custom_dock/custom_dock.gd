@tool
extends EditorPlugin

const my_dock = preload("res://addons/my_custom_dock/my_dock.tscn")
var dock_instance = null

func _enter_tree():
	dock_instance = my_dock.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UL, dock_instance)


func _exit_tree():	
	remove_control_from_docks(dock_instance)
	dock_instance.queue_free()
