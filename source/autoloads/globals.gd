extends Node


# Time globals

# Current rate of time passing.
#	1.0 is default
#	< 1.0 is slowed down
#	> 1.0 is speed up
var time_modifier = 1.0

var played_intro = true


# Instance globals
var boss_health_instance = null
var camera_instance = null
var health_instance = null
var main_instance = null
var music_instance = null
var player_instance = null
var queen_instance = null
var world_instance = null


func reset_player_instance() -> void:
	self.player_instance = null
