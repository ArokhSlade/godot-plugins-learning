@tool
extends EditorPlugin

func _enter_tree():
	# Initialization of the plugin goes here.
	print("Hello editor plugin just entered tree")
	add_custom_type("MyButton", "Button", preload("res://addons/my_custom_node/my_button.gd"), preload("res://addons/my_custom_node/icon.svg"))


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("MyButton")
	print("goodbye editor plugin just left tree")
