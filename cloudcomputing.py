import requests
import time
headers = {
    'Content-Type': 'multipart/form-data',
}

files = {
    'marks': ('cloud_lab_data.csv', open('C:\\Users\\Dell\\Desktop\\cloud_lab_data.csv', 'rb')),
}
while(True) :
    time.sleep(1)
    response = requests.post('http://192.168.43.44:5000/storeData/marks', headers=headers, files=files)
