from fastapi import FastAPI, HTTPException
import logging

# Initialize logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI()

@app.get("/")
def read_root():
    try:
        logger.info("Root endpoint accessed")
        return {"message": "Welcome to Azure Cloud API Engineer Handbook"}
    except Exception as e:
        logger.error(f"An error occurred: {e}")
        raise HTTPException(status_code=500, detail="Internal Server Error")