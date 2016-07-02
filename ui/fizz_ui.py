import requests

class FizzUi():

    def __init__(self):
        page_size = raw_input("Please enter page size: ")
        max_val = raw_input("Please enter max value: ")
        page_number = raw_input("Please enter page number: ")
        r = requests.get('http://localhost:3000/api/v1/fizz_buzz')
        fav = requests.get('http://localhost:3000/api/vi/favourites')
        a = r.json()

        self.display_values(a, fav)


    def display_values(self, a, fav):

    	for i in a:
    		print i[0]
    		print i[1]




FizzUi()