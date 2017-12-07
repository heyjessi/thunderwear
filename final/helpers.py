import json, requests, random
from cs50 import SQL
from random import randint

db = SQL("sqlite:///info.db")

def randomize(table, string):
    """ Output random number based on specified column constraint in specified table """
    totaltype = (db.execute("SELECT count(*) FROM " + table + " WHERE type = '" + string + "'")[0]['count(*)'] - 1)
    return str(randint(0, totaltype))


def weather(geo):
    """Output outfit based on weather"""

    # Check cache if location has already been inputted
    try:
        if geo in weather.cache:
            return weather.cache[geo]
    except AttributeError:
        weather.cache = {}

    # Get latitude and longitude coordinates of inputted location via google maps API
    loc = requests.get("https://maps.googleapis.com/maps/api/geocode/json?address=" + geo + "&sensor=false&key=AIzaSyBUmgRrYPgEGJHzzaxPinYQWbTPBEyJCSk")
    lat = str(loc.json()['results'][0]['geometry']['location']['lat'])
    lng = str(loc.json()['results'][0]['geometry']['location']['lng'])

    # Store weather code and high and low temperature for the day
    r = requests.get("https://api.weatherbit.io/v2.0/forecast/daily?&lat=" + lat + "&lon=" + lng + "&key=12edc6e8c7894f3fbb196450f1b58e48&days=1&units=I")
    code = str(r.json()['data'][0]['weather']['code'])
    high = str(r.json()['data'][0]['max_temp'])
    low = str(r.json()['data'][0]['min_temp'])

    # Retrieve weather information for next 12 hours
    r = requests.get("https://api.weatherbit.io/v2.0/forecast/hourly?&lat=" + lat + "&lon=" + lng + "&key=12edc6e8c7894f3fbb196450f1b58e48&hours=12&units=I")

    # Create list for the outfit group table names
    table = ["vhot", "hot", "mild", "cool", "cold"]

    # Create list of temperature lower bounds for each outfit group
    temperature = [80, 70, 60, 50, -1000]

    # Create list for temperature tally
    data = [0, 0, 0, 0, 0]
    # Tally the number of hourly "feels like" temperatures in each outfit group for the next 12 hours
    for j in range(12):
        for i in range(4):
            if float(r.json()['data'][j]['app_temp']) > temperature[i]:
                data[i] += 1
                break
            elif i == 3:
                data[4] += 1
    # Sort data in descending order and store index with highest and second highest values
    sort_data = list(data)
    sort_data.sort(key=int, reverse=True)
    mode = data.index(sort_data[0])
    mode2 = data.index(sort_data[1])

    # Store the outfit group names with highest and second highest tallies
    firsttbl = table[mode]
    secondtbl = table[mode2]

    # Store the temperature lower bound of the highest tally
    mode = temperature[mode]

    # Store the difference between the highest and second highest tally
    x = sort_data[0] - sort_data[1]

    temptable = [firsttbl, secondtbl]

    # Only execute if the difference is at most 2
    if x <= 2:
        # Randomly select one of the two tables
        randomtbl = random.choice(temptable)
        randomoffset = randomize(randomtbl, "top")

        # Select one of the however many "tops" are in the randomly selected table
        temp = db.execute("SELECT item from " + randomtbl + " WHERE type = 'top' LIMIT 1 OFFSET " + randomoffset)

        # Only continue if the previously selected "top" is not a dress
        if temp[0]['item'] != 'dress':
            # Choose the other table that was not previously selected
            if randomtbl == temptable[0]:
                randomtbl = temptable[1]
            else:
                randomtbl = temptable[0]
            randomoffset = randomize(randomtbl, "bottom")

            # Select one of the however many "bottoms" are in the randomly selected table
            temp.append(db.execute("SELECT item from " + randomtbl + " WHERE type = 'bottom' LIMIT 1 OFFSET " + randomoffset)[0])
    else:
        # Iterate over the first four temperature groupings
        for i in range(5):
            # Only execute if the mode equals the lower bound of the outfit grouping
            if mode == temperature[i]:
                # Randomly select one of the "tops" and one of the "bottoms" in the certain outfit grouping and break if successful
                randomoffset = randomize(table[i], "top")

                temp = db.execute("SELECT item from " + table[i] + " WHERE type = 'top' LIMIT 1 OFFSET " + randomoffset)
                randomoffset = randomize(table[i], "bottom")
                temp.append(db.execute("SELECT item from " + table[i] + " WHERE type = 'bottom' LIMIT 1 OFFSET " + randomoffset)[0])
                break
    # Execute if any one of the two tables was the "cold" table
    if "cold" in temptable:
        counter = 0
        # Randomly select any 2 of the miscellaneous items suggested in cold weather
        while True:
            randomoffset = randomize("misc", "cold")
            temp.append(db.execute("SELECT item from misc WHERE type = 'cold' LIMIT 1 OFFSET " + randomoffset)[0])
            counter += 1
            # Stops same item from being suggested twice
            if temp[len(temp) - 1]['item'] == temp[len(temp) - 2]['item']:
                temp.pop()
                counter -= 1
            elif counter == 2:
                break

    # Select the 2 items suggested for the weather code for rain
    if code[0] is "2" or "3" or "5":
        for i in range(2):
            temp.append(db.execute("SELECT item from misc WHERE type = 'rain'")[i])

    # Add high and low temperature and weather code onto list of clothing items
    temp.append({'item': high})
    temp.append({'item': low})
    temp.append({'item': code})

    # # Cache results
    weather.cache[geo] = temp
    # # Return results
    return weather.cache[geo]