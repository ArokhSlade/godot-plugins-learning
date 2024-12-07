@tool
extends Node

var hidden : int

func _get_property_list():
	return [
		{ "name": "fake_property", "type": TYPE_INT }
	]

func _set(property, value):
	if property == "fake_property":
		hidden = value
		return true		
	return false
	
func _get(property):
	if property == "fake_property":
		return hidden
	
	return null
