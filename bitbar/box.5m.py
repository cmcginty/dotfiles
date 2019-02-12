#!/usr/local/bin/python3

import lib.stock as stocks

q = stocks.get_quote("BOX")

stocks.print_quote(q)
print("---")
stocks.print_quote(q, show_percent=True, link=True)
