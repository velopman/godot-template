extends Node


var __screenshot_count = 0

func _ready() -> void:
	if !OS.is_debug_build():
		self.call_deferred("queue_free")

	self.pause_mode = Node.PAUSE_MODE_PROCESS


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_B):
		self.__screenshot()

func __screenshot():
	var capture = self.get_viewport().get_texture().get_data()
	capture.flip_y()
	capture.save_png("user://screenshot_%d.png" % self.__screenshot_count)
	self.__screenshot_count += 1
	OS.shell_open(OS.get_user_data_dir())
