from datetime import datetime
import os
import redis

from flask import Flask
from flask import request, redirect, render_template, url_for
from flask import Response

app = Flask(__name__)
app.redis = redis.StrictRedis(host="127.0.0.1", port=6379, db=0, decode_responses=True)

# Be super aggressive about saving for the development environment.
# This says save every second if there is at least 1 change.  If you use
# redis in production you'll want to read up on the redis persistence
# model.
app.redis.config_set("save", "1 1")

@app.route("/", methods=["GET", "POST"])
def main_page():
    if request.method == "POST" and request.form["entry"].strip():
        # Add the datetime to the message. This makes it easier to see updates.
        message = datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "> " + request.form["entry"].strip()
        app.redis.lpush("entries", message)
        return redirect(url_for("main_page"))
    else:
        entries = app.redis.lrange("entries", 0, -1)
        return render_template("main.html", entries=entries)

@app.route("/clear", methods=["POST"])
def clear_entries():
    app.redis.ltrim("entries", 1, 0)
    return redirect(url_for("main_page"))

if __name__ == "__main__":
  app.run(host="0.0.0.0", port=80)
