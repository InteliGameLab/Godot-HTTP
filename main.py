from flask import Flask, request, jsonify
import sqlite3

app = Flask(__name__)

conn = sqlite3.connect('data.db', check_same_thread=False)

conn.execute('''CREATE TABLE IF NOT EXISTS dados
            (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                player TEXT NOT NULL,
                score INTEGER
            )''')

@app.route('/', methods=['GET'])
def get():
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dados ORDER BY score DESC')
    data = cursor.fetchall()
    return jsonify(data)

@app.route('/post', methods=['POST'])
def post():
    data = request.get_json()
    player = data.get('player')
    score = data.get('score')
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dados WHERE player = ?', (player,))
    data = cursor.fetchone()
    if data is None:
        cursor.execute('INSERT INTO dados (player, score) VALUES (?, ?)', (player, score))
    else:
        cursor.execute('UPDATE dados SET score = ? WHERE player = ?', (score, player))
    conn.commit()
    return jsonify({"status": "sucesso"})

if __name__ == '__main__':
    app.run(debug=True)