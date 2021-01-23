extends HSlider


export (String) var display_name = "Volume"
export (String) var controlled_bus = null

onready var label = $label

var __bus_index: int = -1
var __setting_name: String = ""
var __volume_max: float = 0.0
var __volume_min: float = -80.0


func _ready() -> void:
	if !self.controlled_bus:
		Logger.warn("Volume slider '%s' does not have a controlled bus." % self.display_name)

	self.__bus_index = AudioServer.get_bus_index(self.controlled_bus)
	self.__volume_max = AudioServer.get_bus_volume_db(self.__bus_index)

	var name_formatted = self.display_name.to_lower().replace(" ", "_")
	self.__setting_name = "volume/%s" % name_formatted

	self.label.text = self.display_name

	self.connect("value_changed", self, "volume_changed")


func volume_changed(value: float) -> void:
	var volume_db = lerp(self.__volume_min, self.__volume_max, value)
	AudioServer.set_bus_volume_db(self.__bus_index, volume_db)

	SettingsManager.emit_signal("setting_changed", self.__setting_name, value)
