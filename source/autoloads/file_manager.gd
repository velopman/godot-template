extends Node


func load_file(path: String) -> String:
	var file = File.new()

	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()

	return content


func load_json(path: String):
	return JSON.parse(self.load_file(path)).result


func save_file(path: String, content: String) -> void:
	var file = File.new()

	file.open(path, File.WRITE)
	file.store_string(content)
	file.close()


func save_json(path: String, content) -> void:
	self.save_file(path, JSON.print(content))
