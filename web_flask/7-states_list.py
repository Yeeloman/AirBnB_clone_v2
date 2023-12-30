#!/usr/bin/python3
"""a script that starts a flask application"""

from flask import Flask, render_template
from models import storage
from models.state import State

app = Flask(__name__)


@app.teardown_appcontext
def close_database(arg):
    """closes the current database"""
    storage.close()


@app.route('/states_list', strict_slashes=False)
def states_list_page():
    """returns a list of all states"""
    states = storage.all(State).values()
    return render_template('7-states_list.html', states=states)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
