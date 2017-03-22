CC = g++
FLAGS = -Wall -std=c++11

magicmirror: magicmirror.o
	$(CC) $(FLAGS) magicmirror.o -o magicmirror
	
magicmirror.o: magicmirror.cpp Mirror.h
	$(CC) $(FLAGS) magicmirror.cpp -o magicmirror.o

Mirror.o: Mirror.cpp Widget.h rapidjson/document.h
	$(CC) $(FLAGS) Mirror.cpp -o Mirror.o

Widget.o: Widget.cpp RefreshInterval.h
	$(CC) $(FLAGS) Widget.cpp -o Widget.o

HTTPRequest.o: HTTPRequest.cpp curl.h
	$(CC) $(FLAGS) HTTPRequest.cpp -o HTTPRequest.o

ApiWidget.o: ApiWidget.cpp HTTPRequest.h
	$(CC) $(FLAGS) ApiWidget.cpp -o ApiWidget.o

TimeWidget.o: TimeWidget.cpp Widget.h
	$(CC) $(FLAGS) TimeWidget.cpp -o TimeWidget.o

MovieWidget.o: MovieWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) MovieWidget.cpp -o MovieWidget.o

QuoteOfTheDay.o: QuoteOfTheDay.cpp ApiWidget.h
	$(CC) $(FLAGS) QuoteOfTheDay.cpp -o QuoteOfTheDay.o

WeatherWidget.o: WeatherWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) WeatherWidget.cpp -o WeatherWidget.o

StockMarketWidget.o: StockMarketWidget.cpp ApiWidget.h HTTPRequest.h
	$(CC) $(FLAGS) StockMarketWidget.cpp -o StockMarketWidget.o

NYTNewsFeedWidget.o: NYTNewsFeedWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) NYTNewsFeedWidget.cpp -o NYTNewsFeedWidget.o 


all:
	$(g++) *.cpp -o magicmirror

clean: 
	\rm -fvr *.o *.out *~ magicmirror