@tool
extends VBoxContainer
class_name SceneSelectUI

var resource_editor : EditorResourcePicker

var scene_list : SceneList

func initialize_list(p_scene_list : SceneList):
	scene_list = p_scene_list
	resource_editor = EditorResourcePicker.new()
	resource_editor.base_type = "SceneList"
	resource_editor.toggle_mode = true
	resource_editor.edited_resource = scene_list
	resource_editor.resource_selected.connect(on_resource_selected)
	add_child(resource_editor)

var contents : MyResourceEditor = preload("res://addons/scene-select-plugin/my_resource_editor.tscn").instantiate()


func on_resource_selected(resource: Resource, inspect: bool):
	print("resource selected : ", resource, " : inspect : ", inspect)
	if (contents.get_parent_control() == null):
		resource_editor.get_parent_control().add_child(contents)
		print(scene_list.scenes)
		contents.fill_item_list(scene_list.scenes)
	else :
		contents.visible = !contents.visible	
	
func update_ui(property: StringName, value: Variant, field: StringName, changing: bool):			
	print("update_ui")
	print(resource_editor.edited_resource)
	print(scene_list.scenes)
	$Label.text = str(value)
	if value is SceneSelect:
		var scene_select = value as SceneSelect
		$OptionButton.selected = scene_select.selection_index
		
		var preview = EditorInterface.get_resource_previewer()
		print("is it null? ", scene_select.selected_scene)
		if scene_select.selected_scene != null:
			preview.queue_edited_resource_preview(scene_select.selected_scene,self,"update_icon",null)
		else : 
			$TextureRect.texture = null
			
func update_ui_simple(choice : int):
	print("update_ui_simple(%s)" % choice)
	print(resource_editor.edited_resource)
	print(scene_list.scenes)
	$Label.text = "why exists me?"
	
	$OptionButton.selected = choice
	
	var preview = EditorInterface.get_resource_previewer()
	#print("is it null? ", scene_select.selected_scene)
	#if scene_select.selected_scene != null:
		#preview.queue_edited_resource_preview(scene_select.selected_scene,self,"update_icon",null)
	#else : 
		#$TextureRect.texture = null

func update_icon( path:String , preview:Texture2D ,  thumbnail_preview:Texture2D, userdata:Variant):
	$TextureRect.texture = preview
