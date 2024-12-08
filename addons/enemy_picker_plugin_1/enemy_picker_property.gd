@tool
extends EditorProperty


#var resource_instance = preload("res://addons/enemy_picker_plugin/enemy_list.gd").new()
var resource_array : Array[PackedScene] = GlobalEnemyList.entities
var ui_instance = preload("res://addons/enemy_picker_plugin_1/enemy_picker_ui.tscn").instantiate()
var option_button = ui_instance.find_child("OptionButton")

var current_selection : int
var selected_enemy

var current_value : EnemyChoice = EnemyChoice.new()

func _init():
	print("initalizing property...")
	init_ui()	
	#for property in ui_instance.get_property_list():
		#print(property)
	
func init_ui():
	add_child(ui_instance)
	
	for option in GlobalEnemyList.enemy_names:
		option_button.add_item(option)
		print("option added:" + option)
	
	option_button.item_selected.connect(on_item_selected)
	
	property_changed.connect(ui_instance.update_label)
	
func on_item_selected(value):
	print("selected: " + str(value))
	current_selection = value
	selected_enemy = get_enemy_for_index(value)
	print("enemey selected:" + str(selected_enemy))
	print(get_edited_object(), " -> ", get_edited_property())
	current_value.enemy_scene = selected_enemy
	emit_changed(get_edited_property(),current_value)
	
	update_property()
	
	var preview = EditorInterface.get_resource_previewer()
	preview.queue_edited_resource_preview(current_value.enemy_scene,self,"update_icon",null)

func update_icon( path:String , preview:Texture2D ,  thumbnail_preview:Texture2D, userdata:Variant):
	ui_instance.find_child("TextureRect").texture = preview
	
func get_enemy_for_index(index : int):
	return resource_array[index]
	
func _update_property():	
	var new_value : EnemyChoice = get_edited_object()[get_edited_property()]
	var new_scene : PackedScene 
	if (new_value): 
		new_scene = new_value.enemy_scene
	current_selection = clampi(resource_array.find(new_scene), 0, resource_array.size()-1)
	

	
