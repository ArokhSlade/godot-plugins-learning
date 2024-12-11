@tool
extends Node

static func print_props(obj : Object):
	var props = obj.get_property_list()
	for prop in props:
		print(prop)
	print("-------")
