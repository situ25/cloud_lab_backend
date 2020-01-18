# cloud_lab_backend
Dummy backend to store data for examining the efficiency of a cloud environment

This project is a flask backened that aims to predict the carbon emissions by your vehicle during a trip  

To set it up on your local (Windows):  
  1.Install python 3.7.5  
  2.mkdir cloud_lab_backend  
  3.cd cloud_lab_backend  
  4.py -3 -m venv venv  
  5.venv\Scripts\activate  
  6.pip install -r requirements.txt  
  7.set FLASK_APP=flaskApp  
  8.set FLASK_ENV=development  
  9.flask run  
  
When running for the first time, after these steps run the command, flask init-db, to initialise the required database.   
Ensure that the database configurations have been set in the config.py file.
If any dependencies are required to be installed, after doing a pip install, run: pip freeze > requirements.txt

