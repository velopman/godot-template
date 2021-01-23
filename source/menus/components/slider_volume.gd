extends HSlider


export (String) var display_name = "Volume"
export (String) var controlled_bus = null

onready var label = $label

var __bus_index = null
var __volume_max = 0.0
var __volume_min = -80.0


func _ready() -> void:
	if !self.controlled_bus:
		Logger.warn("Volume slider '%s' does not have a controlled bus." % self.display_name)

	self.__bus_index = AudioServer.get_bus_index(self.controlled_bus)
	self.__volume_max = AudioServer.get_bus_volume_db(self.__bus_index)

	self.label.text = self.display_name

	self.connect("value_changed", self, "volume_changed")


func volume_changed(value: float) -> void:
	var volume_db = lerp(self.__volume_min, self.__volume_max, value)
	AudioServer.set_bus_volume_db(self.__bus_index, volume_db)
