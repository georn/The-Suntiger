# search_engine

#### Objects

* Crawler: 
- initialises with array of seeds
- fetches data from each seed url
	- all the urls on the page
	- keywords provided in the head of the page (given by tag
	  'meta')
	- description provided in the head of the page (given by tag
	  'meta')
	- all headers on the page (h1 unto h6)
	- the full text on a page, as a raw string without
	  punctuation (given by tag 'p')
- saves all data in a CSV file. Each row in the file is a new
  seed

* Indexer:
- For each seed, removes all the stopwords from data provided
- Stems the words (e.g. groups together words such as 'fish',
  'fishes', 'fishing', etc.)
- Counts amount of time each word is being used from each data
  attribute in a hash [PROVIDE EXAMPLE]
- includes the index of the seed, to correlate with the data
  in the CSV

* Ranker:
- Calculates a score when a query word is provided
- Takes in hash provided by the indexer, plus the query
- Calculates final score by multiplying the amount of times a
  word is used by a value dependent on where the word is
found.
	- Multiplier breakdown:
			url: 5x
		 	keywords: 4x
			description: 3x
			headers: 2x
			text: 1x

	- Example: query word = "spider"
		used in keywords: 2
						description: 1
						headers: 2
						text: 6
		total score: (2 x 4) + (1 x 3) + (2 x 2) + (6 x 1) = 21

* Interface
- Interacts with the user
- User can give a keyword to search
- for all seeds a ranker is created
	- each ranker calculates the total score relative to the
	  query
- all ranks are placed in an array and sorted by score
- All seed urls are printed in the proposed sorting, highest
  rank at the top


			
Index:

Ranking: Each seed gets its own Ranker, where a hash of relevant data and the query is
put in

Interface:

#### User Stories

EPIC
```
As a Person,
So I can expand my knowledge,
I would like to search some websites
```

Breakdown
```
As a Person,
So I can search for a specific topic,
I can type in some keywords
```

```
As a Person,
So I can choose the right website to visit,
I want the options to be displayed
```

```
As a Person,
So I can choose the most relevant website,
I want the options to be ranked
```

```
As a Person,
So I have the right information,
I want the search engine to look for specific matching data on a webpage
```

```
As a Maintainer,
So I can save storage,
I want to stem the raw texts from webpages before indexing
```

```
As a Maintainer,
So I have control over my crawler,
I want the possibility to add URLs to the seed manually
```


RANKING

```
Ranking Multiplier

url :         5
keywords:     4
description:  3
headers:      2
text:         1
```
