@tool
extends EditorPlugin

var inspector_plugin = preload("res://addons/scene-select-plugin/scene_select_inspector.gd")
var plugin_instance
var ui_instance = preload("res://addons/scene-select-plugin/scene_select_ui.tscn").instantiate()

func _enter_tree():
	plugin_instance = inspector_plugin.new()	
	add_inspector_plugin(plugin_instance)
	scene_changed.connect(on_scene_changed)
	add_autoload_singleton("SceneSelectRegistry", "res://addons/scene-select-plugin/scene_select_registry.gd")	

var node_count = 0
func on_node_added(node:Node):
	print("node added: %d : " % node_count, node)
	node_count += 1


func _exit_tree():
	remove_inspector_plugin(plugin_instance)
	remove_autoload_singleton("SceneSelectRegistry")

func on_scene_changed(scene_root:Node):
	print("scene changed!!!")
	print_rich("[color=purple]initialize all scene selects via call-back: [/color]", scene_root)
	#SceneSelectRegistry.visualize_all_scenes()



#func _handles(object):
	#if object is Node2D && object.has_method("on_scene_selection_changed"):
		#print("object is SceneSelectTest: ", object)
		#var script = object.get_script()
		#print (script.scene_instance)
	#if object is SceneSelect:
		#print("handles ", object)
		#return true
		#
#func _edit(object):
	#print("_edit()ing ", object)
	#
#func _make_visible(visible):
	#print("_make_visible() ", visible)
#
#func _forward_canvas_gui_input(event):
	#print("canvas gui input received: ", event)
	#return true
