@tool
extends VBoxContainer

func update_label(property: StringName, value: Variant, field: StringName, changing: bool):
	print("updating label: ", property)
	$Label.text = str(value)
