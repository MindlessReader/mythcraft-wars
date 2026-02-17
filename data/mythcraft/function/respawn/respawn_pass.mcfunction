# Periodic entity sync — spawns/kills entities to match scoreboard counts
# Runs every 5 seconds during active game
# Each city/skill is only synced if its chunks are loaded (marker validation)

# Sync cities
function mythcraft:respawn/sync_city {cityName:City1, cityId:City1}
function mythcraft:respawn/sync_city {cityName:City2, cityId:City2}
function mythcraft:respawn/sync_city {cityName:City3, cityId:City3}
function mythcraft:respawn/sync_city {cityName:City4, cityId:City4}
function mythcraft:respawn/sync_city {cityName:City5, cityId:City5}
function mythcraft:respawn/sync_city {cityName:City6, cityId:City6}
function mythcraft:respawn/sync_city {cityName:City7, cityId:City7}

# Sync skill locations
function mythcraft:respawn/sync_skill {locationName:Attack, locationId:Attack}
function mythcraft:respawn/sync_skill {locationName:Defense, locationId:Defense}
function mythcraft:respawn/sync_skill {locationName:Magic, locationId:Magic}
function mythcraft:respawn/sync_skill {locationName:Special, locationId:Special}

# Reschedule
schedule function mythcraft:respawn/respawn_pass 5s
