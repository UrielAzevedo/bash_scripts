from urllib.request import urlopen
from bs4 import BeautifulSoup

def by_name(name):
 
    url = f"https://artvee.com/dl/{name}/#00"
    print(url)
    try:
        html = urlopen(url)
    except:
        error = {'erro' : '404 - not found'}
        return error
    
    soup = BeautifulSoup(html, 'lxml')

    image = soup.find_all('img', {"class" : "wp-post-image wp-post-image"})
    
    return image[0]['src']

print (by_name("las-meninas"))
