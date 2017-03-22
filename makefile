CC = g++
OBJS = magicmirror.o Mirror.o Widget.o HTTPRequest.o ApiWidget.o TimeWidget.o MovieWidget.o QuoteOfTheDay.o WeatherWidget.o StockMarketWidget.o NYTNewsWidget.o
FLAGS = -Wall -std=c++11

magicmirror: $(OBJS)
	$(CC) $(FLAGS) $(OBJS) -o magicmirror
	
magicmirror.o: magicmirror.cpp Mirror.h
	$(CC) $(FLAGS) magicmirror.cpp -c -o magicmirror.o

Mirror.o: Mirror.cpp Widget.h rapidjson/document.h
	$(CC) $(FLAGS) Mirror.cpp -c -o Mirror.o

Widget.o: Widget.cpp RefreshInterval.h
	$(CC) $(FLAGS) Widget.cpp -c -o Widget.o

HTTPRequest.o: HTTPRequest.cpp curl.h
	$(CC) $(FLAGS) HTTPRequest.cpp -c -o HTTPRequest.o

ApiWidget.o: ApiWidget.cpp HTTPRequest.h
	$(CC) $(FLAGS) ApiWidget.cpp -c -o ApiWidget.o

TimeWidget.o: TimeWidget.cpp Widget.h
	$(CC) $(FLAGS) TimeWidget.cpp -c -o TimeWidget.o

MovieWidget.o: MovieWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) MovieWidget.cpp -c -o MovieWidget.o

QuoteOfTheDay.o: QuoteOfTheDay.cpp ApiWidget.h
	$(CC) $(FLAGS) QuoteOfTheDay.cpp -c -o QuoteOfTheDay.o

WeatherWidget.o: WeatherWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) WeatherWidget.cpp -c -o eatherWidget.o

StockMarketWidget.o: StockMarketWidget.cpp ApiWidget.h HTTPRequest.h
	$(CC) $(FLAGS) StockMarketWidget.cpp -c -o StockMarketWidget.o

NYTNewsFeedWidget.o: NYTNewsFeedWidget.cpp ApiWidget.h
	$(CC) $(FLAGS) NYTNewsFeedWidget.cpp -c -o NYTNewsFeedWidget.o 


all:
	$(CC) $(FLAGS) *.cpp -o magicmirror

clean: 
	\rm -fvr *.o *.out *~ magicmirror
