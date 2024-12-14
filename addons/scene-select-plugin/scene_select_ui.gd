@tool
extends VBoxContainer
class_name SceneSelectUI


func update_ui(property: StringName, value: Variant, field: StringName, changing: bool):			
	print("update_ui")
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
	$Label.text = "str(value)"
	
	$OptionButton.selected = choice
	
	var preview = EditorInterface.get_resource_previewer()
	#print("is it null? ", scene_select.selected_scene)
	#if scene_select.selected_scene != null:
		#preview.queue_edited_resource_preview(scene_select.selected_scene,self,"update_icon",null)
	#else : 
		#$TextureRect.texture = null

func update_icon( path:String , preview:Texture2D ,  thumbnail_preview:Texture2D, userdata:Variant):
	$TextureRect.texture = preview
