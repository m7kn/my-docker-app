from flask import Flask
import os

app = Flask(__name__)

# Környezeti változóból olvassuk a nevet, ha nincs, marad a "Világ"
GREETING = os.environ.get("GREETING", "Világ")

@app.route('/')
def hello_world():
    return f'Helló {GREETING}, egy Docker konténerből!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
