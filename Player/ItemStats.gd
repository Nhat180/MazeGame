extends Node

var coin = 0 setget setCoin 
var sword = 0 setget setSword
var key = 0 setget setKey

signal coin_changed(value)
signal sword_changed(value)
signal key_changed(value)

func setCoin(value):
	coin = value
	emit_signal("coin_changed",coin)

func setSword(value):
	sword = value
	emit_signal("sword_changed",sword)

func setKey(value):
	key = value
	emit_signal("key_changed", key)
