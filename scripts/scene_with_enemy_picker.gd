@tool
extends Node

@export var enemy : EnemyList

enum enemy_types{NONE,BIG,SMALL}
var x : int

@export var my_enemy : enemy_types :
	set(value):
		x = value+10
		my_enemy = value
		print("set ",x)
	get():
		#print(x)
		return x

func _get_property_list():
	return [{
		"name" : "my_enemy1",
		"type" : TYPE_INT,
		"hint" : PROPERTY_HINT_ENUM,
		"hint_string" : "x,y,z"
	}]

func _get(property):
	if property == "my_enemy":
		#print("_get my_enemy")
		return my_enemy


func _set(property,value):
	if property == "my_enemy1":
		print("_set my_enemy")
		return true
	false
