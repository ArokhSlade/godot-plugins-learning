extends EditorProperty

var control : Button = Button.new()

var value : int 

var updating = false

func _init():
	add_child(control)
	add_focusable(control)
	refresh_control_text()
	value = randi()
	control.pressed.connect(_on_button_pressed)


func _on_button_pressed():
	if (updating):
		return
	value = randi()
	refresh_control_text()
	emit_changed(get_edited_property(), value)


func refresh_control_text():
	control.text = "value: " + str(value)
	return
	
func _update_property():
	var new_value = get_edited_object()[get_edited_property()]
	print("new value: " + str(new_value))
	if (new_value == value):
		return		
	updating = true
	value = new_value
	refresh_control_text()
	updating = false
	
