extends Node


# Lifecyle methods
func _ready() -> void:
	if OS.has_feature('JavaScript'):
		JavaScript.eval(
			"document.getElementById('status').style.display = 'none'"
		)
