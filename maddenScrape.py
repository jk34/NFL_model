import os
from bs4 import BeautifulSoup
# Python 3.x
from urllib.request import urlopen, urlretrieve, quote
from urllib.parse import urljoin

# Remove the trailing / you had, as that gives a 404 page
url10 = 'http://maddenratings.weebly.com/madden-nfl-10.html'
url03 = 'http://maddenratings.weebly.com/madden-nfl-2003.html'
urllist=['madden-nfl-2003.html', 'madden-nfl-2004.html', 'madden-nfl-2005.html', 'madden-nfl-06.html', 
'madden-nfl-07.html', 'madden-nfl-08.html', 'madden-nfl-09.html', 'madden-nfl-10.html', 'madden-nfl-11.html', 'madden-nfl-12.html']
urlorig = 'http://maddenratings.weebly.com/'
OUTPUT_DIR = '/home/jerry/Desktop/NFL/madden'
ODlist = ['03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
for i in range(0, len(urllist)):
    u = urlopen(urlorig+urllist[i])
    try:
        html = u.read().decode('utf-8')
    finally:
        u.close()

    soup = BeautifulSoup(html, "html.parser")

    # Select all A elements with href attributes containing URLs starting with http://
    for link in soup.select('a[href^="/"]'):
        href = link.get('href')

        # Make sure it has one of the correct extensions
        if not any(href.endswith(x) for x in ['.csv','.xls','.xlsx']):
            continue
        href = urlorig+href
        print(href)

        #filename = href.rsplit('/', 1)[-1]
        filename = os.path.join(OUTPUT_DIR+ODlist[i], href.rsplit('/', 1)[-1])
        print("Downloading %s to %s..." % (href, filename) )
        urlretrieve(href, filename)
        print("Done.")
