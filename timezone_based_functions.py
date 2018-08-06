# -*- coding: utf-8 -*-

# User based time function

from datetime import datetime
import pytz


@api.multi
def tz_time(self, date_str):
    DATETIME_FORMAT = "%Y-%m-%d %H:%M:%S"
    user_tz = self.sudo().env.user.tz
    tz = pytz.timezone(user_tz) or pytz.utc
    # get localized dates
    date_x = pytz.utc.localize(datetime.strptime(date_str, DATETIME_FORMAT)).astimezone(tz)
    return date_x
