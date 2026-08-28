import subprocess
from flask import Flask, request

app = Flask(__name__)

# Test-only placeholder. This is AWS's documented example key, not a real credential.
AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE"

@app.route("/run")
def run():
    cmd = request.args.get("cmd")
    return subprocess.check_output(cmd, shell=True)

@app.route("/calc")
def calc():
    return str(eval(request.args.get("expr")))

if __name__ == "__main__":
    app.run(debug=True)
