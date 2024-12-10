@tool
class_name SceneList
extends Resource

@export var scenes : Array[PackedScene] :
	set(value):
		scenes = value
		update_names()
		
@export var names : Array[String]


func _init():
	_validate_property(names)


func _ready():
	update_names()	


func update_names():
	if scenes == null:
		return
		
	var result : Array[String] = []
	for packed_scene in scenes: 
		var name : String
		if packed_scene == null: 
			name = "<null>"
		else :
			var full_path = packed_scene.resource_path
			var name_begin_index = full_path.rfind("/") + 1
			var name_end_index = full_path.rfind(".")
			var name_length = name_end_index - name_begin_index
			name = full_path.substr(name_begin_index, name_length)
		print("name: ", name)
		result.append(name)
	names = result	


static func join_strings(strings):
	var result : String = ""
	if strings.size() >= 1:
		result += strings[0]		
	for i in range(1,strings.size()):
		result += "," + strings[i]
	return result


func _validate_property(property):
	if property.has("name") && property["name"] == "names":
		property["usage"] |= PROPERTY_USAGE_READ_ONLY
