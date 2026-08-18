"""
VERSÃO SEGURA da aplicação Mitigações aplicadas
"""

from flask import Flask, request, render_template_string, escape
import sqlite3
import os

app = Flask(__name__)

DATABASE = os.getenv("DATABASE_PATH", "users.db")

@app.route("/login", methods=["POST"])
def login():
    username = request.form.get("username", "")
    password = request.form.get("password", "")

    # Queries parametrizadas (proteção contra SQL Injection)
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    cursor.execute(
        "SELECT * FROM users WHERE username = ? AND password = ?",
        (username, password)
    )
    user = cursor.fetchone()
    conn.close()

    if user:
        # Escape de output (proteção contra XSS)
        safe_username = escape(username)
        return render_template_string("<h1>Bem-vindo {{ user }}</h1>", user=safe_username)
    return "Login falhado", 401

@app.route("/search")
def search():
    q = request.args.get("q", "")
    safe_q = escape(q)
    return f"<h2>Resultados para: {safe_q}</h2>"

if __name__ == "__main__":
    app.run(debug=False, host="127.0.0.1", port=5000)
