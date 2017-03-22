CC = g++
FLAGS = -Wall -std=c++11

magicmirror: magicmirror.o
	$(CC) $(FLAGS) magicmirror.o -o magicmirror
	
magicmirror.o: magicmirror.cpp Mirror.h
	$(CC) $(FLAGS) magicmirror.cpp -c magicmirror.o

Mirror.o: Mirror.cpp Widget.h rapidjson/document.h
	$(CC) $(FLAGS) Mirror.cpp -c Mirror.o

Widget.o: Widget.cpp RefreshInterval.h
	$(CC) $(FLAGS) Widget.cpp -c Widget.o

HTTPRequest.o: HTTPRequest.cpp curl.h
	$(CC) $(FLAGS) HTTPRequest.cpp -c HTTPRequest.o

ApiWidget.o: ApiWidget.cpp HTTPRequest.h
	$(CC) $(FLAGS) ApiWidget.cpp -c ApiWidget.o

TimeWidget.o: TimeWidget.cpp Widget.h
	$(CC) $(FLAGS) TimeWidget.cpp -c TimeWidget.o

MovieWidget.o: MovieWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) MovieWidget.cpp -c MovieWidget.o

QuoteOfTheDay.o: QuoteOfTheDay.cpp ApiWidget.h
	$(CC) $(FLAGS) QuoteOfTheDay.cpp -c QuoteOfTheDay.o

WeatherWidget.o: WeatherWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) WeatherWidget.cpp -c WeatherWidget.o

StockMarketWidget.o: StockMarketWidget.cpp ApiWidget.h HTTPRequest.h
	$(CC) $(FLAGS) StockMarketWidget.cpp -c StockMarketWidget.o

NYTNewsFeedWidget.o: NYTNewsFeedWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) NYTNewsFeedWidget.cpp -c NYTNewsFeedWidget.o 


all:
	$(CC) $(FLAGS) *.cpp -o magicmirror

clean: 
	\rm -fvr *.o *.out *~ magicmirror
