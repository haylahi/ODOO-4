# -*- coding: utf-8 -*-
from datetime import datetime

# refference link: https://stackoverflow.com/questions/31359150/convert-date-from-excel-in-number-format-to-date-format-python
def exceldate2normal(exceldate):
    # example : 43211 to datetime.datetime(2018, 4, 21, 0, 0)
    if exceldate:
        return datetime.fromordinal(datetime(1900, 1, 1).toordinal() + int(exceldate) - 2)
