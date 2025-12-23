#!/usr/bin/env python3

import datetime

with open("/home/infosec/lab7/cron_log.txt", "a") as f:
    f.write(f"Email sent to admin at {datetime.datetime.now()}\n")

