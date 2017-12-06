#!/usr/bin/env python3

import requests
import json

WEB_SERVER_IP_PORT = "127.0.0.1:8000"


def test_api():
    url = "http://{}/clothmatch/query".format(WEB_SERVER_IP_PORT)

    request_content = {}
    request_content['customer_id'] = 1
    request_content['clothing'] = [1, 2, 3, 4, 5, 6]

    try:
        r = requests.post(url, data=request_content)
        if r.status_code == 200:
            avatar_result = json.loads(r.content.decode())

            print(avatar_result)
        else:
            print('status_code = ', r.status_code)
    except requests.exceptions.ConnectionError as e:
        print("ConnectionError when report result : {}".format(e))
    except Exception as e:
        print("Error happened when report result : {}".format(e))


if __name__ == '__main__':
    test_api()
