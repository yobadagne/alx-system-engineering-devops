#!/usr/bin/python3
from requests import get


def count_words(subreddit, word_list):
    """ recursive functions """
    headers = {"User-Agent": "yobadagne"}
