@tool
class_name SceneSelect
extends Resource

signal selection_changed
signal scene_list_changed

@export var scene_list : SceneList : 
	set(value):
		print("scene list set from ", scene_list, " to ", value)
		scene_list = value
		if scene_list != null:
			scene_list.scenes_set.connect(on_scenes_set)		
		
@export var selected_scene : PackedScene : # refers to an element of the associated array
	set(value):
		print("selected scene set from ", selected_scene, " to ", value)
		if (value != null):
			selected_scene = value
			call_deferred("update_visual")
			emit_changed()

var selected_index : int # used by scene_select_property 
#@export var selected_index : int # used by scene_select_property 
#@export var selected_index : int : # used by scene_select_property 
	#set(value):
		#print("selected index set from ", selected_index, " to ", value)
		#selected_index = value
		
var scene_instance : Node


func update_visual():	
	# 1st aproach: try adding scene instance to "parent"
	# i see no way of accessing the specific node that this Resource is "attached" to.
	# best i can do is attach to the root scene
	scene_instance = selected_scene.instantiate()
	var user_node = Engine.get_main_loop().edited_scene_root
	user_node.add_child(scene_instance) 




func on_selection_changed(property: StringName, value: Variant, field: StringName, changing: bool):
	print("selection_changed")	
	selection_changed.emit()
	emit_changed()
	

# 2nd approach:
# have a global autoload st keep book on all SceneSelect objects
# I thought "from the outside" i could "see" the nodes/scenes the SceneSelects are "attached" to
# So via a EditorPlugin I could on_scene_changed have the auto-load tell all the scene selects to "visualize()"
# but all I have is a reference to this resource. without a reference to the node that "owns" them, i am stuck...
func _init():	
	print_me()
	SceneSelectRegistry.all_scene_selects.append(self)

func visualize(owning_node:Node):
	if scene_instance!=null && !scene_instance.is_queued_for_deletion(): 		
		scene_instance.queue_free()
		scene_instance = null
	if selected_scene != null:
		scene_instance = selected_scene.instantiate()
		owning_node.add_child(scene_instance)

#todo: replace extra signals with just emit_changed()
func on_scenes_set():
	scene_list_changed.emit()
	emit_changed()
	

func print_me():
	print(self, " : ", scene_list, " : ", selected_scene, " : ", selected_index)
	


func _validate_property(property):
	if property.name == "selected_scene":
		property.usage |= PROPERTY_USAGE_READ_ONLY
	if property.name == "selected_index":
		property.usage |= PROPERTY_USAGE_STORAGE
