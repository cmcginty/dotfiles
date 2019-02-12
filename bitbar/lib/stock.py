# -*- coding: utf8 -*-

import json
from collections import namedtuple
from urllib import request

Stock = namedtuple("Stock", ["ticker", "price", "percent", "source"])


def get_quote(ticker):
    r = request.urlopen("https://api.iextrading.com/1.0/stock/{}/quote".format(ticker))
    data = json.loads(r.read())
    return Stock(
        ticker, data["latestPrice"], data["changePercent"], data["latestSource"]
    )


def print_quote(q, show_percent=False, link=False):
    color = "#606060" if q.source.lower() == 'close' else "red" if q.percent < 0 else "green"
    # direction = "⬇" if q.percent < 0 else "⬆"
    direction = ""
    output = f"{q.ticker} {q.price:0.2f}{direction}"
    output += f" ({q.percent * 100:0.2f}%)" if show_percent else ""
    output += f"| color={color}"
    output += f" href=https://www.finance.yahoo.com/quote/{q.ticker}" if link else ""
    print(output)
