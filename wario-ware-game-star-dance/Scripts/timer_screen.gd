extends Node2D
@onready var Hp_container : HBoxContainer = $"TextureRect/HP-Container"
@onready var Hp : TextureRect = $"TextureRect/HP-Container/Hp"
@onready var Hp2: TextureRect = $"TextureRect/HP-Container/Hp2"
@onready var Hp3: TextureRect = $"TextureRect/HP-Container/Hp3"
@onready var Hp4: TextureRect = $"TextureRect/HP-Container/Hp4"
@onready var Hp5: TextureRect = $"TextureRect/HP-Container/Hp5"
@onready var level : RichTextLabel = $Level
@onready var timer : RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0) #Using the created function
	if Global.minigames_played < 3: 
		Global.minigames_played = Global.minigames_played +1
		get_tree().change_scene_to_file("res://Scenes/minigames_" + str(Global.minigames_played) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/tittle_screen.tscn")

func _process(delta: float) -> void:
	match Global.lives:
		4:
			Hp.hide()
		3:
			Hp.hide()
			Hp2.hide()
		2:
			Hp.hide()
			Hp2.hide()
			Hp3.hide()
		1:
			Hp.hide()
			Hp2.hide()
			Hp3.hide()
			Hp4.hide()
		0:
			Hp_container.hide()
	timer.text = str(time)
	level.text = "Level" + str(Global.minigames_played)

func Timer(start_time: float):
	time = start_time
	while time > (0.0):
		await wait(0.1)
		time -=0.1
	return 

func wait(seconds : float) -> void:
	await get_tree().create_timer(seconds).timeout
