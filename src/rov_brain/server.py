from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def status():
    return {"status": "ROV brain online"}