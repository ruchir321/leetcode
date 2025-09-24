# date = "2025-09-24"
# y, m, d = date.split(sep="-")

# print(int(y) + 2, m, type(d))

# range()
date = "2019-02-09"
y, m, d = date.split(sep="-")

y = int(y)
m = int(m)
d = int(d)

days_in_month = {1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30}
days = 0
if y % 4 == 0:
    if y % 100 == 0:
        if y % 400 == 0:
            days_in_month[2] = 29
    else:
        days_in_month[2] = 29

if m > 1:
    for i in range(1, m):
        days = days_in_month[i] + days
    days = days + d
else:
    days = d

print(days + 1)