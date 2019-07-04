#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')

db = client.sample_db
collection = db.sample_collection

data = {
    "key1": "val1",
    "key2": "val2",
    "key3": "val3",
}

result = collection.insert_one(data)

data2 = [
    {
        "k1_1": "val1_1",
        "k1_2": "val1_2"
    },
    {
        "k2_1": "val2_1",
        "k2_2": "val2_2"
    }
]

result2 = collection.insert_many(data2)
find = collection.find_one({"key1": "val1"})
print(find)
