"""UI to interact with Rails FizzBuzz API."""
import requests


class FizzUi():
    """Methods to interact with user."""

    def __init__(self):
        self.collect_fizzbuzz_parameters()

    def collect_fizzbuzz_parameters(self):
        """Determine which FizzBuzz numbers to return."""
        self.page_size = raw_input("Enter page size: ")
        self.max_val = raw_input("Enter max value: ")
        self.page = raw_input("Enter page number: ")
        self.collect_favourites_parameters()

    def collect_favourites_parameters(self):
        """Determine whether to add or delete any favourites."""
        self.fav_add = raw_input("Enter any favourite number to add: ")
        self.fav_del = raw_input("Enter any favourite number to remove: ")
        self.make_api_requests()

    def make_api_requests(self):
        """Make calls to the API."""
        res = requests.get('http://localhost:3000/api/v1/fizz_buzz',
                           {'page_size': self.page_size,
                            'max': self.max_val,
                            'page': self.page})

        requests.post('http://localhost:3000/api/v1/favourites',
                      {'number': self.fav_add})
        requests.delete('http://localhost:3000/api/v1/favourites/{0}'.
                        format(self.fav_del))

        fav_list = requests.get('http://localhost:3000/api/v1/favourites')

        favourites = fav_list.json()

        if res.status_code == requests.codes.ok:
            response = res.json()
            self.display_values(response, favourites)
        else:
            print ('Incorrect parameters!')
            self.collect_fizzbuzz_parameters()

    def display_values(self, response, favourites):
        """Display FizzBuzz list and Favourites to the user."""
        for r in response:
            print r[0]
            print r[1]

        print "Favourites:"

        for f in favourites:
            print f['number']

        self.collect_fizzbuzz_parameters()

FizzUi()
