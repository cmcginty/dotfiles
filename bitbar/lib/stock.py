# -*- coding: utf8 -*-

from collections import namedtuple
import yfinance as yf

Stock = namedtuple("Stock", ["ticker", "price", "percent", "source"])


def get_quote(ticker):
    q = yf.Ticker(ticker)
    price = q.info["bid"]
    open_ = q.info["open"]
    pcnt = (price - open_) / open_
    return Stock(ticker, price, pcnt, "close")


def print_quote(q, show_percent=False, link=False):
    color = (
        "#606060"
        if q.source.lower() == "close"
        else "red"
        if q.percent < 0
        else "green"
    )
    # direction = "⬇" if q.percent < 0 else "⬆"
    direction = ""
    output = f"{q.ticker} {q.price:0.2f}{direction}"
    output += f" ({q.percent * 100:0.2f}%)" if show_percent else ""
    output += f"| color={color}"
    output += f" href=https://www.finance.yahoo.com/quote/{q.ticker}" if link else ""
    print(output)
