#!/bin/usr/python3
""" Top ten """
from  requests import get


def top_ten(subreddit):
    """ returns top ten hot posts """
    headers = {"User-Agent": "yobadagne"}
    try:
        result = get("https://www.reddit.com/r/{}.json?limit=10&sort=hot"
                      .format(subreddit), headers=headers,
                      allow_redirects=False).json()
        children  = result.get("data").get("children")
        for i in children:
            print(i.get("data").get("title"))
    except:
        print(None)
