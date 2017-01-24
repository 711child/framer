

left_heart = new Layer
	x: Align.center(-47)
	y: Align.center
	height: 177
	width: 96
	image: "images/left heart.png"

right_heart = new Layer
	x: Align.center(48)
	y: Align.center
	height: 177
	width: 96
	image: "images/right heart.png"
	
flip_heart = new Layer
	x: Align.center(48)
	y: Align.center
	height: 177
	width: 96
	image: "images/right heart.png"
	originX: 0
	
flip_heart.states.add
	default:
		rotationY: 0
		brightness: 90
	middle_state:
		rotationY: -90
		brightness: 140
	over_state:
		rotationY: -180
		brightness: 90
		
#一个状态到另一个状态的时长
flip_heart.states.animationOptions = 	
	curve:"linear"
	time: 0.4

showlove = new Layer
	x: Align.center()
	y: Align.center(150)
	height: 80
	width: 320
	backgroundColor: "F57B7B"
	opacity: 50
	
#将1到2，2到3，3跳转1 的动作集成为函数	
handle = ()->
	flip_heart.states.switch("middle_state")
	Utils.delay 0.4,->
		flip_heart.states.switch("over_state")
		Utils.delay 0.5,->
			flip_heart.states.switchInstant("default")
	#当前时间与出生时间
	date = new Date()
	nowtime = date.getTime()/1000
	birth_date = new Date(1990,7,11)
	starttime = birth_date.getTime()/1000 
	
	#每个单位为时间间隔对上一个单位包含本单位的个数取余
	years = parseInt((nowtime-starttime)/(3600*24*365))
	months = parseInt((nowtime-starttime)/(3600*24*30)%12)
	days = parseInt((nowtime-starttime)/(3600*24)%30)
	hours = parseInt((nowtime-starttime)/3600%24)
	minutes = parseInt((nowtime-starttime)/60%60)
	seconds = parseInt((nowtime-starttime)%60)

	showlove.html =  "我在这个星球停留了: " + years + "年" + months + "月" + days + "天" + hours + "小时" + minutes + "分" + seconds + "秒"
	

#循环函数
handle()
Utils.interval 1, ->
	handle()
	

	

# print years,months,days,hours,minutes,seconds






	
#showlove.html()
	


    


