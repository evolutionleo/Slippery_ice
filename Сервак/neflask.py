from flask import Flask
from flask import request
# import flask
import json
# from json import dumps
# from jsonmerge import merge

app = Flask(__name__)

p1_pack = {
	# "default":[],
	# "p":1
}
p2_pack = {
	# "default":[],
	# "p":2
}
 
@app.route('/realtime', methods=['POST'])
def realtime():

	global p1_pack
	global p2_pack
	# _json = request.get_json()
	# dic = json.loads(_json)
	# print(_json)

	dic = request.get_json()
	# _list = dic['default']
	ptype = int(dic['p'])

	print("Incoming from Player #"+str(ptype))

	if(ptype == 1):
		p1_pack = dic
		ans = p2_pack
		# ans = json_dumps(p2_pack,separators=(',', ':'))
	elif(ptype == 2):
		p2_pack = dic
		ans = p1_pack
		# ans = json_dumps(p1_pack,separators=(',', ':'))
	else:
		ans = "ERROR!!!"

	print("SENDING "+str(ans)+" To him")
	return ans

if(__name__ == "__main__"):
	app.run(host="62.113.112.109", port=5050, debug=False)
