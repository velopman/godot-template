extends Node

signal setting_changed(name, value)


var __settings: Dictionary = {}
var __settings_default: Dictionary = {
	"volume": {
		"master": 1.0,
		"music": 1.0,
		"sound_effects": 1.0
	}
}


func _ready() -> void:
	self.connect("setting_changed", self, "__setting_changed")
	# try loading settings file first
	self.__settings = self.__settings_default


func __setting_changed(name: String, value) -> void:
	var path = name.split("/")
	var location = self.__settings

	for index in range(path.size() - 1):
		var part = path[index]

		if location.has(part):
			location = location.get(part)
		else:
			Logger.warn("Could not update setting '%s'" % name)
			return

	var setting_name = path[path.size() - 1]
	if location.has(setting_name):
		location[setting_name] = value
	else:
		Logger.warn("Could not update setting '%s'" % name)
		return
