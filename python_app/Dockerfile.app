#run python image
FROM python:3.9

#make dir name app and cd to it
WORKDIR /app

#copy req to app dir
COPY . .

#install framework 
RUN pip install -r requirements.txt

#command run app
CMD ["python", "hello.py"]
