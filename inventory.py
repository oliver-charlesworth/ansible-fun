#!/usr/bin/env python3
import json


JOB_HOSTS = [
  "job9",
]

DEV_HOSTS = [
  "abc001",
  "abc002",
]

PROD_HOSTS = [
  "abc001",
]


if __name__ == "__main__":
  print(json.dumps({
    "_meta": {
      "hostvars": {}
    },

    "dev": {
      "hosts": [ f"dev@{h}" for h in DEV_HOSTS + JOB_HOSTS ],
    },

    "prod": {
      "hosts": [ f"prod@{h}" for h in PROD_HOSTS + JOB_HOSTS ],
    },
  }))
