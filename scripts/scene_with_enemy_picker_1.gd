@tool
extends Node

@export var enemy : EnemyChoice :
	set(value):		
		enemy = value
		if enemy:
			print_rich("[color=green]setting scene %s to %s[/color]" %[enemy.enemy_scene, value.enemy_scene])
			set("enemy_scene", value.enemy_scene)
			#notify_property_list_changed() #NOTE(ArokhSlade,2024 12 08): if I do this, the property ui will be re-initialized, resetting the drop-down menu and thus undoing the user's selection
		#
#@export var enemy_scene : PackedScene : 
	#set(value):
		#if GlobalEnemyList.entities.find(value) >= 0:
			#if enemy:
				#enemy.enemy_scene = value #this won't update. we're supposed to call notify_property_list_changed, but that makes things worse...
				#notify_property_list_changed() #NOTE(ArokhSlade,2024 12 08): if I do this, the property ui will be re-initialized, resetting the drop-down menu and thus undoing the user's selection
	
func _ready():
	enemy = EnemyChoice.new()
#
func _get_property_list():
	return([{
		"name" : "enemy_scene",
		"type" : TYPE_OBJECT,
		"tye_hint" : PROPERTY_HINT_RESOURCE_TYPE,
		"hint_string" : "PackedScene",
		"usage" : PROPERTY_USAGE_DEFAULT #| PROPERTY_USAGE_READ_ONLY #if it's read-only we cannot change enemy by drag-and-drop
	}])
	
func _get(property):
	if property == "enemy_scene":
		if enemy:
			return enemy.enemy_scene

func _set(property, value):
	if property == "enemy_scene":
		var index = GlobalEnemyList.entities.find(value)
		if index >= 0:
			if enemy:
				enemy.enemy_scene = value
				enemy.scene_index = index
				notify_property_list_changed()
		return true
	return false
