extends OptionButton


func fill_with_array(options:Array[String]):
	for item in options: 
		self.add_item(item)
