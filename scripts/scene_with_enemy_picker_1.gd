@tool
extends Node

@export var enemy : EnemyChoice :
	set(value):
		enemy = value
		#set("enemy_scene", value.enemy_scene)
		#notify_property_list_changed()
	get():		
		return enemy


func _get_property_list():
	return([{
		"name" : "enemy_scene",
		"type" : TYPE_OBJECT,
		"tye_hint" : PROPERTY_HINT_RESOURCE_TYPE,
		"hint_string" : "PackedScene",
		"usage" : PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_READ_ONLY
	}])
	
func _get(property):
	if property == "enemy_scene":
		if enemy:
			return enemy.enemy_scene

func _set(property, value):
	if property == "enemy_scene":
		if GlobalEnemyList.entities.find(value) >= 0:
			if enemy:
				enemy.enemy_scene = value
		return true
	return false
