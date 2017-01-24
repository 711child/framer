bg = new Layer
	width: 750
	height: 1334
	image: "images/bg.png"
bg.states.add
	bgBlur:
		blur:12
		
btn = []
for i in [0..4]
	btn[i] = new Layer
		x: Align.center
		y: Align.bottom(-30)
		width: 150
		height: 150
		image: "images/btn"+i+".png"
		
	btn[i].states.add
		pop:
			x: Align.center
			y: 1134-170*i

btnAdd = new Layer
	width: 150
	height: 150
	borderRadius: 75
	backgroundColor: '#06C34A'
	x: Align.center
	y: Align.bottom(-30)
btnAdd.states.add
	grey:
		backgroundColor:'#B0B0B0'

plus = new Layer
	superLayer: btnAdd
	x: Align.center
	y: Align.bottom(-35)
	scale: 0.8
	width: 80
	height: 80
	image: "images/plus.png"
plus.states.add
	Rotate:
		rotation: 45

btnAdd.onClick (event, layer) ->
	btnAdd.states.next()
	plus.states.next()
	bg.states.next()
	for i in [0..4]
		btn[i].states.next()
		
Framer.Defaults.Animation = curve: "spring(300,25,10)"


		
		
	
		
		
	
	
	
	
