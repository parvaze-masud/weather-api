from fastapi import FastAPI
from fastapi.responses import JSONResponse
import socket
from datetime import datetime
import requests
import os

app = FastAPI()

# Replace with your version
API_VERSION = "1.0.0"

# Third-party weather API details (now using OpenWeatherMap)
WEATHER_API_URL = os.getenv("BASE_URL", "https://api.openweathermap.org/data/2.5/weather")
CITY_NAME = "Dhaka"

# Load API Key from environment variable
WEATHER_API_KEY = os.getenv("API_KEY")

def fetch_weather():
    try:
        params = {
            "q": CITY_NAME,
            "appid": WEATHER_API_KEY,
            "units": "metric"
        }
        response = requests.get(
            WEATHER_API_URL,
            params=params,
            timeout=5
        )
        response.raise_for_status()
        data = response.json()
        temp_celsius = data["main"]["temp"]
        return {"temperature": str(temp_celsius), "temp_unit": "c"}
    except Exception as e:
        print(f"Weather fetch error: {e}")
        return {"temperature": "N/A", "temp_unit": "c"}

@app.get("/api/hello")
async def get_hello():
    hostname = socket.gethostname()
    now = datetime.now().strftime("%y%m%d%H%M")
    weather = fetch_weather()

    response = {
        "hostname": hostname,
        "datetime": now,
        "version": API_VERSION,
        "weather": {
            "dhaka": weather
        }
    }
    return JSONResponse(content=response)

@app.get("/api/health")
async def health_check():
    try:
        params = {
            "q": CITY_NAME,
            "appid": WEATHER_API_KEY,
            "units": "metric"
        }
        response = requests.get(
            WEATHER_API_URL,
            params=params,
            timeout=5
        )
        response.raise_for_status()
        weather_api_status = "reachable"
    except Exception as e:
        weather_api_status = f"unreachable: {e}"

    health_status = {
        "status": "ok",
        "weather_api": weather_api_status
    }
    return JSONResponse(content=health_status)

