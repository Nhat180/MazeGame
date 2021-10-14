extends Area2D

var itemStat = ItemStats

# Update the coins, swords and key stat when player collect the correponding item
func _on_Coin_body_entered(body):
	itemStat.coin += 1
	queue_free()

func _on_Key_body_entered(body):
	itemStat.key += 1
	queue_free()

func _on_Sword_body_entered(body):
	itemStat.sword += 1
	queue_free()
