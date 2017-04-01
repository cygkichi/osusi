
import csv
import numpy as np
from scipy import stats

f = open('../osusi/res.csv','r')
dataReader = csv.reader(f)

i=1
coses=[]
scores={"h3":[],"h5":[],"h10":[],"s3":[],"s5":[],"s10":[]}

for row in dataReader:
#    print(row)
    cose  = row[5]
    score = int(row[1])
    coses.append(cose)
    scores[cose].append(score)
    if(i>150):
        scores[coses[0]].pop(0)
        coses.pop(0)

    print(i,row[5],row[1],end=" ")
    for c in ["h3","h5","h10"]:
        print(c,end=" ")
        if(scores[c] != []):
            print(int(      len(scores[c])),end=" ") #N
            print(int(  np.mean(scores[c])),end=" ") #Mean
            print(int(np.percentile(scores[c],25)),end=" ") #1Q
            print(int(np.percentile(scores[c],50)),end=" ") #Median
            print(int(np.percentile(scores[c],75)),end=" ") #4Q
        else:
            print(0,"NaN","NaN","NaN","NaN",end=" ")
    print()
    i = i + 1


