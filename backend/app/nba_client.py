from nba_api.stats.static import players
from nba_api.stats.endpoints import playercareerstats

def get_player_stats(player_name: str):
    player_dict = players.find_players_by_full_name(player_name)
    if not player_dict:
        return None

    player_id = player_dict[0]["id"]
    career = playercareerstats.PlayerCareerStats(player_id=player_id)
    stats_df = career.get_data_frames()[0]
    simplified_stats = stats_df[[
        "SEASON_ID", "TEAM_ABBREVIATION", "PLAYER_AGE", "GP", "PTS", "REB", "AST"
    ]].to_dict(orient="records")
    return simplified_stats

