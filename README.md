# weedsample - a central database for the Intellilgent Herbicide Applicator web deliverable (W210, Spring 2019, John, Zach, Stan, Json)

This runs on Heroku, and has two functions.  First, it logs data from the field population of herbicide dispensers.   Second,
it generates synthetic "stub" data for development and debugging the web deliverable.

## Function 1: REST accessed logger of JSON data from the Herbicide Applicator

* Logs JSON sent by applicator, returns selected date ranges (REST API, JSON data returned) of actual data

## Function 2: Stub data generator for development/debugging/demonstrating the web deliverable

This data simulation function was key for defining our APIs early, and letting team members quickly start iterating
the web deliverable.   REST interface is similar to real data interface with the exception that the request
goes to a "sample data" endpoint.

This also permits generating more data than we'll actually produce with our hardware prototype, over a wider
geographic range (i.e. not just one of the team members front yard....)   This makes for a more representative
demo of the web deliverable.

