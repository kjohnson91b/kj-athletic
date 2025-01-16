import axios from "axios";

const BASE_URL = "http://127.0.0.1:5000";

export const getPlayerStats = async (playerName) => {
  try {
    const response = await axios.get(`${BASE_URL}/player/${playerName}`);
    return response.data.stats;
  } catch (error) {
    console.error("Error fetching player stats:", error);
    throw error;
  }
};
