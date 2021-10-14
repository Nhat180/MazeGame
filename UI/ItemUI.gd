extends Control

onready var coinUI = $Coin
onready var swordUI = $Sword
onready var keyUI = $Key

var coin setget setCoinUI
var sword setget setSwordUI 
var key setget setKeyUI 

# Update number of coin on game UI
func setCoinUI(value):
	coin = clamp(value, 0, 8)
	coinUI.rect_size.x = coin * 16

# Update number sword on game UI
func setSwordUI(value):
	sword = clamp(value, 0, 8)
	swordUI.rect_size.x = sword * 384

# Update number key on game UI
func setKeyUI(value):
	key = value
	keyUI.rect_size.x = key * 16

func _ready():
	self.coin = ItemStats.coin
	self.sword = ItemStats.sword
	self.key = ItemStats.key
	ItemStats.connect("coin_changed", self, "setCoinUI")
	ItemStats.connect("sword_changed", self, "setSwordUI")
	ItemStats.connect("key_changed", self, "setKeyUI")
