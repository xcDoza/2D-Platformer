extends CanvasLayer

signal back_pressed

onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var windowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowedButton

var fullscreen = false

func _ready():
	windowModeButton.connect("pressed",self,"on_window_mode_pressed")
	backButton.connect("pressed",self,"on_back_button_pressed")
	update_display()
	
func update_display():
	windowModeButton.text = "FULLSCREEN" if fullscreen else "WINDOWED"
	
func on_window_mode_pressed():
	fullscreen = !fullscreen
	OS.window_fullscreen = fullscreen
	update_display()

func on_back_button_pressed():
	emit_signal("back_pressed")
