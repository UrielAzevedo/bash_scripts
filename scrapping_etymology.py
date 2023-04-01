from urllib.request import urlopen
from bs4 import BeautifulSoup

def all_syntaxes_(word):

    url = f"https://www.etymonline.com/word/{word}#etymonline_v_25849"
    try:
        html = urlopen(url)
    except:
        error = {'error' : '404 - not found'}
        return error
    soup = BeautifulSoup(html, 'lxml')

    word_etymology = soup.find_all('section', {"class" : "word__defination--2q7ZH"})
    etymology_tittles = []
    etymology_tittles.append(soup.find('h1', {"class" : "word__name--TTbAA"}))
    etymology_tittles.extend(soup.find_all('p', {"class" : "word__name--TTbAA"}))
    etymology_meanings = []

    for etymology_meaning in word_etymology:
        etymology_meaning = etymology_meaning.findChildren('p', recursive=False)
        text = ''
        for child in etymology_meaning:
            text += child.text
        etymology_meanings.append(text)

    meaning_rows = []

    for i, tittle in enumerate(etymology_tittles):
        if '(' not in tittle.text:
            etymology_tittles[i] = 'null'
        else:
            etymology_tittles[i] = tittle.text.split('(', 1)[1].split(')')[0].split('.',1)[0]
        meaning_rows.append({'category' : etymology_tittles[i], 'meaning': etymology_meanings[i]})

    return meaning_rows

def noun_search_(word):
    search_results = all_syntaxes_(word)
    if "error" in search_results:
        return search_results

    nouns = []

    for result in search_results:
        if result['category'] == 'n':
            nouns.append(result)

    if nouns == []:
        return {"error" : "404 - not found"}

    return nouns

def verb_search_(word):
    search_results = all_syntaxes_(word)
    if "error" in search_results:
        return search_results

    verbs = []

    for result in search_results:
        if result['category'] == 'v':
            verbs.append(result)

    if verbs == []:
        return {"error" : "404 - not found"}
        
    return verbs

def adjective_search_(word):
    search_results = all_syntaxes_(word)
    if "error" in search_results:
        return search_results
        
    adjectives = []

    for result in search_results:
        if result['category'] == 'adj':
            adjectives.append(result)

    if adjectives == []:
        return {"error" : "404 - not found"}

    return adjectives

print (noun_search_("car"))
