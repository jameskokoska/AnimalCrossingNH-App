entries = ["nameMain","name-id","sell","obtain","weather","rarity","start-time","end-time","jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"]

dataOut = []
input1 = "0"

print(entries[0])
input1 = "0"
dataTemp = []
while(input1!=""):
    input1 = input()
    if(input1!=""):
        dataTemp.append(input1)
dataOut.append(dataTemp)

for i in range(1,len(entries)):
    dataTemp = []
    print("Progress: " + entries[i])
    for j in range(0,len(dataOut[0])):
        input1 = input()
        if(input1!=""):
            dataTemp.append(input1)
        else:
            dataTemp.append("")
    dataOut.append(dataTemp)
    #input("-----------Break-----------")
    print("Progress: " + str(round(i/len(entries)*100,1)))


print("Progress: " + "Writing to file")

file = open("output.json","w")
file.write("{\n")

for i in range(0,len(dataOut[0])):
    for j in range(0,len(entries)):
        if(j==0):
            file.write("\t\""+dataOut[j][i]+"\":{\n")
        elif(i==len(dataOut[0])-1 and j==len(entries)-1):
            file.write("\t\t\""+entries[j]+"\":\""+dataOut[j][i]+"\"\n\t}\n")
        elif(j==len(entries)-1):
            file.write("\t\t\""+entries[j]+"\":\""+dataOut[j][i]+"\"\n\t},\n")
        else:
            file.write("\t\t\""+entries[j]+"\":\""+dataOut[j][i]+"\",\n")

file.write("}\n") 
file.close()

print("Progress: " + "Done")
