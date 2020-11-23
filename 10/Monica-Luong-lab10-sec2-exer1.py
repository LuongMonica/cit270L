#!/usr/bin/python3
# Gets server log & generates a report that counts:
#   -errors in each month
#   -errors in each php file

# module for regex
import re

# get input for server log file
log = str(input("Enter the server log file you want to generate a report for: "))

# setup count for each month
jan_count = 0; feb_count = 0; mar_count = 0; apr_count = 0; may_count = 0; jun_count = 0; jul_count = 0; aug_count = 0; sep_count = 0; oct_count = 0; nov_count = 0; dec_count = 0

# setup dictionary that'll hold php filenames and count
php = {}

# open inputted server log file and read it
# if regex matches to certain month, make the length of that returned list the count for the month
file = open(log, "r") 
content = file.read()
jan_list = re.findall(r"J(an?)", content)
jan_count = len(jan_list)
feb_list = re.findall(r"F(eb?)", content)
feb_count = len(feb_list)
mar_list = re.findall(r"M(ar?)", content)
mar_count = len(mar_list)
apr_list = re.findall(r"A(pr?)", content)
apr_count = len(apr_list)
may_list = re.findall(r"M(ay?)", content)
may_count = len(may_list)
jun_list = re.findall(r"J(un?)", content)
jun_count = len(jun_list)
jul_list = re.findall(r"J(ul?)", content)
jul_count = len(jul_list)
aug_list = re.findall(r"A(ug?)", content)
aug_count = len(aug_list)
sep_list = re.findall(r"S(ep?)", content)
sep_count = len(sep_list)
oct_list = re.findall(r"O(ct?)", content)
oct_count = len(oct_list)
nov_list = re.findall(r"N(ov?)", content)
nov_count = len(nov_list)
dec_list = re.findall(r"D(ec?)", content)
dec_count = len(dec_list)

# also tallies up count per php file
php_list = re.findall(r"\/var\/www\/html\/.+\.php", content)  
for x in php_list:
  if x in php:
    php[x] += 1
  else:
    php[x] = 1
file.close()

# create "report.txt" which prints out the 
#   -error count for each month (if > 0)
#   -error count for each php file
report = "report.txt";
file_obj = open(report, "w")
file_obj.write("Error count for each month:\n")
if (jan_count > 0):
  file_obj.write("Jan:" + str(jan_count) + "\n")
if (feb_count > 0):
  file_obj.write("Feb:" + str(feb_count) + "\n")
if (mar_count > 0):
  file_obj.write("Mar:" + str(mar_count) + "\n")
if (apr_count > 0):
  file_obj.write("Apr:" + str(apr_count) + "\n")
if (may_count > 0):
  file_obj.write("May:" + str(may_count) + "\n")
if (jun_count > 0):
  file_obj.write("Jun:" + str(jun_count) + "\n")
if (jul_count > 0):
  file_obj.write("Jul:" + str(jul_count) + "\n")
if (aug_count > 0):
  file_obj.write("Aug:" + str(aug_count) + "\n")
if (sep_count > 0):
  file_obj.write("Sep:" + str(sep_count) + "\n")
if (oct_count > 0):
  file_obj.write("Oct:" + str(oct_count) + "\n")
if (nov_count > 0):
  file_obj.write("Nov:" + str(nov_count) + "\n")
if (dec_count > 0):
  file_obj.write("Dec:" + str(dec_count) + "\n")
file_obj.write(" \n")
file_obj.write("Error count for each php page:\n")
for key in php:
  file_obj.write(str(key) + ":" + str(php[key]) + "\n")
file_obj.close()

print("Report generated. Open " + report + " to see the results")
