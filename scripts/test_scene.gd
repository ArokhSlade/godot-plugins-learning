extends Node2D

var test_instance = preload("res://addons/enemy_picker_plugin_1/enemy_picker_ui.tscn").instantiate()

func _ready():
	test_instance.funky()
