FROM python:3.9.16

RUN wget https://www.tbi.univie.ac.at/RNA/download/sourcecode/2_5_x/ViennaRNA-2.5.1.tar.gz
RUN tar -zxvf ViennaRNA-2.5.1.tar.gz
WORKDIR /ViennaRNA-2.5.1
RUN ./configure
RUN make
RUN make install

WORKDIR /
RUN rm ViennaRNA-2.5.1.tar.gz
RUN rm -rf ViennaRNA-2.5.1

RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install cython
ADD https://api.github.com/repos/1998apoorvmalik/forna-server/git/refs/heads/main version.json
RUN git clone https://github.com/1998apoorvmalik/forna-server.git
WORKDIR /forna-server
RUN pip install -r requirements.txt
RUN cp ./docker-fix/__init__.py /usr/local/lib/python3.9/logging/__init__.py

CMD python forna_server.py -s -d -o 0.0.0.0 -p 8080