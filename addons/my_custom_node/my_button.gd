@tool 
extends Button

@export var x : int = 3
@export var f : float = 3.1
func _enter_tree():
	connect("pressed", clicked)

func clicked():
	print("you clicked me!")
