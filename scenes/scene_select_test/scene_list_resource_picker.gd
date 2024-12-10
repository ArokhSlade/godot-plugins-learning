@tool
class_name SceneListResourcePicker
extends EditorResourcePicker

func _init():
	base_type = "SceneList"
	editable = true
	
const NEW_OPTION = 0

var button

func _handle_menu_selected(option:int) -> bool:	
	print("_handle_menu_selected was called: ", option)
	if (option >= 100):
		print("NEW_OPTION selected. what now? ", option)
		button = Button.new()
		get_parent_control().add_child(button)
		button.text = "hi, it's me button"
		
		print(get_parent_control().get_class().get_basename())
		
	return true

func _set_create_options(menu_node: Object) -> void:
	var popup = menu_node as PopupMenu
	popup.add_item("new option", 100)
	popup.add_item("new option", 101)
