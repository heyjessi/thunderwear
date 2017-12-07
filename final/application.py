from flask import Flask, request, jsonify
from helpers import weather

# Web app
app = Flask(__name__)

@app.route("/algorithm", methods=["POST"])
def algorithm():
    """ Algorithm to take in location and output outfit choices based on the local weather """
    if request.method == "POST":
        # Store JSON information from POST method and pass it as argument to the "weather" function
        r = request.get_json(force=True)
        temporary = weather(r['Location'])

        # Return output in JSON format
        return jsonify(temporary)
