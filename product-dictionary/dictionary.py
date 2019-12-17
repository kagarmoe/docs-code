# Import Libraries
import nltk
import string
import re
from nltk.corpus import stopwords
from string import punctuation
from nltk.probability import FreqDist


chef_text = open('chef.txt', 'r').read()
english_dict = open('en_words.txt', 'r').read()
tokens = nltk.word_tokenize(chef_text)

def cleanupDoc(chef_text):
    stop = list(stopwords.words('english'))
    # Get the english dictionary in the same form as chef_words
    # Likely unnecessary
    english_tokens = nltk.word_tokenize(english_dict)
    english_words = ([token.lower()for token in english_tokens if len(token)>2])
    # preprocess chef file
    chef_text = re.sub('[^A-Za-z]+', ' ', chef_text)
    chef_tokens = nltk.word_tokenize(chef_text)
    # creates all the chef words of more than 2 chars
    chef_dict = ([token.lower()for token in chef_tokens if len(token)>2])
    # de-duplicates the list
    chef_single = list(dict.fromkeys(chef_dict))
    # removes stopwords from de-duped list
    chef_stop = ([token for token in chef_single if token not in stop])
    # removes words from english dict, creating unique chef vocab
    chef_words = ([token for token in chef_stop if token not in english_words])
    chef_words = sorted(chef_words)
    # chef_freq = nltk.FreqDist(chef_words)
    return chef_words

x = cleanupDoc(chef_text)
dictionary = open('dictionary_results.txt', 'w')
print(x, file = dictionary)
dictionary.close

# for word, frequency in x.most_common(500):
#     print(u'{};{}'.format(word, frequency))
# print(type(chef_words))
