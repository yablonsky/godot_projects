extends Label

var accum = 0

func _ready():
	print(self.name, ' ready')

func _init(entity=null, msg=null).(msg):
	msg = 'asdf'
	print(entity, ' ', msg, ' in Label')
	
func _process(delta):
	accum += delta
	var fps = 1.0 / delta
	text = 'Time: %0.4f; FPS: %d' % [accum, fps]