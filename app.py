from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/health")
def health():
    return jsonify({"status": "ok"})


@app.get("/")
def index():
    return jsonify({"message": "server deploy demo"})


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8090)
