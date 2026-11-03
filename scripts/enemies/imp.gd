extends Enemy

var direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	if player:
		verify_exclusion()

		direction = (player.position - position).normalized() #a função norm basicamente transforma o tamanho do vetor em 1, facilitando as conta
		velocity = direction * speed
		
		velocity += knockback_get()

		var collider = move_and_collide(velocity * delta)
		if collider:
			collider.get_collider().knockback = (collider.get_collider().global_position - global_position).normalized() * 50
		
		if direction.x < 0:
			$Sprite2D.flip_h = true
		elif direction.x > 0:
			$Sprite2D.flip_h = false
