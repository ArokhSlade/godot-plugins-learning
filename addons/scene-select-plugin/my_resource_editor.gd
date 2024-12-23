@tool
extends PanelContainer
class_name MyResourceEditor

@onready var item_list : ItemList = $VBoxContainer/ItemList

func fill_item_list(input : Array):
	for item in input:
		item_list.add_item(str(item))
		print("item")
