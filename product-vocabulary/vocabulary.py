# I want to call the function CleanupDoc(file)
# Which prints wordlist of unique project-specific words to file
# And also prints the word frequency of all project words to file or csv

# Import Libraries
import nltk
import string
import re
# Do I really need to import any separate part of a library to use it?
# What are the library sub-parts called?
from nltk.corpus import stopwords
from string import punctuation
from nltk.probability import FreqDist

chef_text = open('chef.txt', 'r').read()
# should I make the vocabulary here or in a function?
english_text = open('en_words.txt', 'r').read()
english_vocab = list(english_text).lower()
tokens = nltk.word_tokenize(chef_text)
stop = list(stopwords.words('english'))

# I want to call this with any file
# cleanupDoc(habitat), etc
# for any docs.txt file
def cleanupDoc(chef_text):
  ### ??? How even is python structured?

# Function to make english vocabulary
# def makeEnglish(english_text):
#     english_vocab = list(english_text).lower()
#     return english_vocab

def makeChefVocab(chef_text):
    # preprocess chef file
    chef_text = re.sub('[^A-Za-z]+', ' ', chef_text)
    chef_tokens = nltk.word_tokenize(chef_text)
    # creates all the chef words of more than 2 chars
    chef_words = ([token.lower()for token in chef_tokens if len(token)>2])
    return chef_words

 def chefUnique(chef_words, english_vocab):
     # de-duplicates the list
    chef_single = list(vocab.fromkeys(chef_words)).sorted()
    # removes stopwords from de-duped list
    chef_stop = ([token for token in chef_single if token not in stop])
    # removes words from english vocab, creating unique chef vocab
    chef_vocab = ([token for token in chef_stop if token not in english_vocab])
    # returns the sorted list of unique chef-specific words
    return chef_vocab


def chefFrequency(chef_words):
    chef_freq = nltk.FreqDist(chef_words)
    return chef_freq

## I'm not sure how to call this --
x = cleanupDoc(chef_text)
vocabulary = open('vocabulary_results.txt', 'w')
print(x, file = vocabulary)
vocabulary.close

## I'm not sure how to ALSO print the frequency
# for word, frequency in x.most_common(500):
#     print(u'{};{}'.format(word, frequency))
# print(type(chef_words))
