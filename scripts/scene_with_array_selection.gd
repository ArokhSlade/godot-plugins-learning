@tool
extends Node2D


@export var my_options : MyOptions

@export var all_the_options : Array[PackedScene]
@export var selected_option : PackedScene

@export var choice_ : int :
	set(new_val):
		choice_ = new_val
		print("set choice normally")
		notify_property_list_changed()
		property_list_changed.emit()	
	get():
		#print("get choice normally")
		return choice_
		
@export var xd : int
	#set(new_val):
		#xd = new_val
		#print("set xd normally")
		#notify_property_list_changed()
		#property_list_changed.emit()	
	#get():
		##print("get xd normally")
		#return xd

# Called when the node enters the scene tree for the first time.
func _ready():
	my_options = MyOptions.new()
	my_options.names_options["first"] = 1
	my_options.names_options["second"] = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _get_property_list():
	var properties = []
	var hint_string = "NONE_1:0"
	var i = 1
	for option in all_the_options:
		hint_string += "," + "opt_%d" % i + ":%d" % i
		i += 1
	properties.append(
		{
			"name" : "choice",
			"type" : TYPE_INT,
			"hint" : PROPERTY_HINT_ENUM,
			"hint_string" : hint_string
		}
	)
	properties.append(
		{
			"name" : "xd",
			"type" : TYPE_INT
		}
	)
	return properties
	
func _get(property):
	if property == "choice":
		#print ("custom get choice")
		return choice_
	if property == "xd":
		print("customized get xd")
		return xd

func _set(property, value):
	if property == "xd":
		print("customized set xd")
		return true
	if property == "choice":
		print ("custom set choice")
		print(value)
		choice_ = value
		print (self._get_property_list())
		return true
	return false
