extends Enemy

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player:
		verify_exclusion()

		direction = (player.position - position).normalized() #a função norm basicamente transforma o tamanho do vetor em 1, facilitando as conta
		velocity = direction * speed

		move_and_slide()
