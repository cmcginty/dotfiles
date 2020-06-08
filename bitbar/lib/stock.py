# -*- coding: utf8 -*-

from collections import namedtuple, defaultdict
import os.path
import pickle
import yfinance as yf

Stock = namedtuple("Stock", ["ticker", "price", "percent", "source"])

DB_NAME = os.path.expandvars("$HOME/.bitbar.quotes.d")


def get_quote(ticker):
    q = yf.Ticker(ticker)
    data_frame = q.history("1d")
    price = data_frame["Close"].values[0]
    _store_price(ticker, price)
    prev_close = q.info["previousClose"]
    pcnt = (price - prev_close) / prev_close
    return Stock(ticker, price, pcnt, "open" if _is_trading(ticker) else "close")


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


def _store_price(ticker, price, size=100):
    try:
        db = pickle.load(open(DB_NAME, "rb"))
    except:
        db = defaultdict(list)
    db[ticker].insert(0, price)
    db[ticker] = db[ticker][:size]
    pickle.dump(db, open(DB_NAME, "wb+"))


def _is_trading(ticker, size=3):
    db = pickle.load(open(DB_NAME, "rb"))
    return len(set(db[ticker][:size])) > 1
