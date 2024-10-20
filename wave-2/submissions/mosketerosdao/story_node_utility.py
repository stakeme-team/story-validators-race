from flask import Flask, jsonify

app = Flask(__name__)

# Datos de ejemplo para el nodo Story
node_data = {
    'status': 'active',
    'block_height': 123456,
    'connected_peers': 15,
    'uptime': '99.99%',
    'validator_address': 'E6BD563D4FC69226B6DE7EB017E33D3CCD5A991A'
}

@app.route('/')
def home():
    return 'Bienvenido a la utilidad del nodo Story'

@app.route('/status', methods=['GET'])
def get_status():
    return jsonify(node_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
