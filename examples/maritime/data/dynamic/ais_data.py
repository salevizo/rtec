 #coord|1443650401|1443650401|228854000|-4.347260000|48.118000000
#limits ['1443650402','1444660250']
# -*- coding: utf-8 -*-
import csv
from operator import itemgetter
import codecs


with open('preprocessed_dataset_RTEC_critical_nd.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter='|')
    data=[]
    for row in csv_reader:
        data.append(row)            
csv_file.close()
data_sorted=sorted(data, key = itemgetter(1))
#print data_sorted
final_data=[]

for item in data_sorted:
    if (int(item[1]) >= int(1443650402) and int(item[1])<=int(1444660250) and int(item[2])<=int(1444660250) and int(item[2])>=int(1443650402) ):
        final_data.append(item)

list_strs=[]
for i in final_data:
    str_ctx=""
    for x in i:
        str_ctx=str_ctx + str(x) + "|"
    list_strs.append(str_ctx)


with open('final_preprocessed_dataset_RTEC_critical_nd.csv', mode='w') as csv_file:
    csv_writer = csv.writer(csv_file, delimiter='\n')
    csv_writer.writerow(list_strs)

csv_file.close()

