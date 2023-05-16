#!/usr/bin/python3
"""Recurse it """
from requests import get


def recurse(subreddit, hot_list=[], after=None):
    """ recursive function """
    headers = {"User-Agent": "yobadagne"}
    try:
        source = "https://www.reddit.com/r/{}.json".format(subreddit)
        if after:
            source = source + "?after={}".format(after)
        my_query = get(source, headers=headers, allow_redirects=False
                       ).json().get("data").get("children")
        for title in my_query:
            hot_list.append(title.get("data").get("title"))
        after = get(source, headers=headers,
                    allow_redirects=False).json().get("data").get("after")
        if after:
            return recurse(subreddit, hot_list, after)
        return hot_list
    except:
        return None
