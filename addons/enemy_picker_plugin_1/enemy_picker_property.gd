@tool
extends EditorProperty


#var resource_instance = preload("res://addons/enemy_picker_plugin/enemy_list.gd").new()
var resource_array : Array[PackedScene] = GlobalEnemyList.entities
var ui_instance = preload("res://addons/enemy_picker_plugin_1/enemy_picker_ui.tscn").instantiate()
var option_button : OptionButton = ui_instance.find_child("OptionButton")


var selected_enemy : PackedScene

var current_value : EnemyChoice

func _init(object):
	current_value = object
	if current_value:
		current_value.print()
	init_ui()	
	
	#for property in ui_instance.get_property_list():
		#print(property)
	
func init_ui():
	print_rich("[color=red]init[/color]")
	
	add_child(ui_instance)
	
	for option in GlobalEnemyList.enemy_names:
		option_button.add_item(option)
	
	option_button.item_selected.connect(on_item_selected)
	
	property_changed.connect(ui_instance.update_ui)	
	emit_changed(get_edited_property(),current_value)
	#update_property()
	
func on_item_selected(value):
	if updating:
		return
		
	
	selected_enemy = get_enemy_for_index(value)		
	current_value = EnemyChoice.new() # TODO: dont't reallocate
	current_value.enemy_scene = selected_enemy
	current_value.scene_index = value
	emit_changed(get_edited_property(),current_value)
	
	#update_property()
	
	
	
func get_enemy_for_index(index : int):
	return resource_array[index]

var updating = false	

func _update_property():
	print_rich("[color=yellow]_update_property...[/color]")
	var new_value : EnemyChoice = get_edited_object()[get_edited_property()]
	#if (new_value == current_value):
		#print_rich("[color=red]value hasn't changed...[/color]")
		#return
		
	updating = true
	print("current selection: ", "<null>" if current_value == null else current_value.scene_index)
	print("selected_index: ", option_button.selected)
	current_value = new_value
	updating = false
