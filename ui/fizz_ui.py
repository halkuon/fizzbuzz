import requests


class FizzUi():

    def __init__(self):
        self.collect_fizzbuzz_parameters()

    def collect_fizzbuzz_parameters(self):
        self.page_size = raw_input("Enter page size: ")
        self.max_val = raw_input("Enter max value: ")
        self.page = raw_input("Enter page number: ")
        self.collect_favourites_parameters()

    def collect_favourites_parameters(self):
        self.fav_add = raw_input("Enter any favourite number to add: ")
        self.fav_del = raw_input("Enter any favourite number to remove: ")
        self.make_api_requests()

    def make_api_requests(self):
        res = requests.get('http://localhost:3000/api/v1/fizz_buzz',
                           {'page_size': self.page_size,
                            'max': self.max_val,
                            'page': self.page})
        requests.post('http://localhost:3000/api/v1/favourites',
                      {'number': self.fav_add})
        requests.delete('http://localhost:3000/api/v1/favourites/{0}'.
                        format(self.fav_del))
        fav_list = requests.get('http://localhost:3000/api/v1/favourites')
        response = res.json()
        favourites = fav_list.json()
        self.display_values(response, favourites)

    def display_values(self, response, favourites):
        for r in response:
            print r[0]
            print r[1]

        print "Favourites:"
        for f in favourites:
            print f['number']

        self.collect_fizzbuzz_parameters()

FizzUi()
