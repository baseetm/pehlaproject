#flask application

from flask import flask
import os 
app = flask(_name_)

@app.route('/', methods = ['get'])

def home():
  return ("Hello welcome to VCC")
if _name_== "_main_":
 app.run(debug=true,host="0.0.0.0", port = 5000)
