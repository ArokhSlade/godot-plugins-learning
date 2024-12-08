@tool
class_name EnemyList
extends Node2D

const enemy_names = ["no_enemy", "enemy_one", "enemy_two", "enemy_three"]
@export var entities : Array[PackedScene]

func _init():
	pass

static func join_strings(strings):
	var result : String = ""
	if strings.size() >= 1:
		result += strings[0]		
	for i in range(1,strings.size()):
		result += "," + strings[i]
	return result
