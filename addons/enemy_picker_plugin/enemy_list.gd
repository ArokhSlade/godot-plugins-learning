@tool
#class_name EnemyList
extends Node2D

const values = ["no_enemy", "enemy_one", "enemy_two", "enemy_three"]
@export var entities : Array[PackedScene]

static func join_strings(strings):
	var result : String = ""
	if strings.size() >= 1:
		result += strings[0]		
	for i in range(1,strings.size()):
		result += "," + strings[i]
	return result

func _get_property_list():
	var properties = []
	var enemy_names = join_strings(values)
		
	properties.append({
		"name" : "enemy",
		#"class_name" : null,
		"type" : TYPE_STRING,
		"hint" : PROPERTY_HINT_ENUM,
		"hint_string" : enemy_names,
		"usage" : PROPERTY_USAGE_DEFAULT
	})
	return properties


func _get(property):
	if property == "enemy":
		#print("_get enemy")
		return entities[0]
	return null


func _set(property, value):
	if property == "enemy":
		print("_set enemy")
		return true
	return false
		


func _init():
	pass
