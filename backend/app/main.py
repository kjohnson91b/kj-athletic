from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from app.nba_client import get_player_stats

app = FastAPI()

# Add CORS Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Frontend URL
    allow_credentials=True,
    allow_methods=["*"],  # Allow all HTTP methods
    allow_headers=["*"],  # Allow all headers
)

@app.get("/")
def root():
    return {"message": "Welcome to the NBA Stats API!"}

@app.get("/player/{player_name}")
def player_stats(player_name: str):
    try:
        stats = get_player_stats(player_name)
        if not stats:
            raise HTTPException(status_code=404, detail="Player not found")
        return {"player_name": player_name, "stats": stats}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
