extends CharacterBody2D
class_name npc
@export var damage_cooldown: float = 0.3
@onready var player: Player = %Player
@export var damage_amount : int = 10
@export var health : int = 10
@export var speed : int = 100
@export var is_hostile : bool = false
@export var move_points : Array[Vector2] = []
@export var move_point : int = 0
@export var dialogue : Array[String] = []
@warning_ignore("shadowed_global_identifier")
@export var inventory : Array[String] = []
@export var inventory_drop : int = 0
#@export var state
@export var type : String = ""
@export var target : Vector2
var can_damage: bool = true

func _ready():
	is_hostile = false
	print("Spike created - deals " + str(damage_amount) + " damage")
	# Connect the collision signal

	pass



func _physics_process(delta: float) -> void:
	movement(delta)
	move_and_slide()

	pass
	

func _on_detection_radius_body_entered(body: Node2D) -> void:
	if player == body: 
		is_hostile = true
		


func _on_detection_radius_body_exited(body: Node2D) -> void:
	if player == body: 
		is_hostile = false



func movement(_delta):
	if is_hostile == true:
		target = player.position
	else:
		target = move_points[move_point]
	var target_direction = position.direction_to(target)
	velocity = speed * target_direction
	if position.distance_to(target)<10:
		move_point+=1
		if move_point > move_points.size()-1:
			move_point = 0
	
	pass


func _reset_damage_cooldown():
	can_damage = true
	print("Spike is ready to damage again")
