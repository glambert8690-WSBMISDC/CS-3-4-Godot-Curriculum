# This next line allows the color of the coin to update without running the game
# It can mostly be ignored, but it must be the first line of the script
@tool

extends Area2D
class_name coin

# Healing properties
@export var coin_amount: int = 100
@export var auto_pickup: bool = true

func _ready():
	print("Coin created - Coins " + str(coin_amount) + "CP")
	# Connect the collision signal
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Check if it's the player
	if body is Player:
		print("Player found Coin!")
		
		# Try to heal the player (will work once they add heal method)
		if body.has_method("coin"):
			body.coin(coin_amount)
			print("Player coined for " + str(coin_amount) + "  CP!")
			
			# Remove the potion after use
			if auto_pickup:
				$AnimationPlayer.play("disappear")
		else:
			print("Player doesn't have coin() method yet - coming in Lesson 2!")
			if auto_pickup:
				$AnimationPlayer.play("disappear")



	# Set the color of the coin
	
