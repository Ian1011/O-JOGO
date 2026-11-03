extends Pickups
class_name Gem

@export var XP: float

func activate():
	super.activate()
	print("+" + str(XP) + " XP")
	player.gain_xp(XP)
