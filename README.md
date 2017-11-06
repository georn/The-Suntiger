# the SunTiger
**CLI Search Engine built from scratch developed during a week project at Makers Academy**

```
			 _   _            __            _____ _                 
			| |_| |__   ___  / _\_   _ _ __/__   (_) __ _  ___ _ __
			| __| '_ \ / _ \ \ \| | | | '_ \ / /\/ |/ _` |/ _ \ '__|
			| |_| | | |  __/ _\ \ |_| | | | / /  | | (_| |  __/ |   
			 \__|_| |_|\___| \__/\__,_|_| |_\/   |_|\__, |\___|_|   
			                                        |___/           
						              (
						               )
						              (
						        /\  .-"""-.  /\
						       //\\/  ,,,  \//\\
						       |/\| ,;;;;;, |/\|
						       //\\\;-"""-;///\\
						      //  \/   .   \/  \\
						     (| ,-_| \ | / |_-, |)
						       //`__\.-.-./__`\\
						      // /.-(() ())-.\ \\
						     (\ |)   '---'   (| /)
						      ` (|           |) `
						        \)           (/

```

## Development

The first couple of days we spent researching about what would imply to build a search engine, investigating about the main algorithms they involved such as the **Crawler**, **Indexer**, **Ranker** and the **Query**. As well as making a choice to which technologies we would use to build it, which we choose Ruby because of the familiarity all the team had.We also spent the afternoon of the first day doing [Mob programming](https://en.wikipedia.org/wiki/Mob_programming) [*spiking*](https://en.wikipedia.org/wiki/Spike_(software_development) some elements of the search engine, so all the team understood the task at hand and thus come with a plan on how to start developing the search engine and our workflow.

[!image](pictures/search-engine-waffle-workflow.jpeg)

We split all four of us into pairs that would work to build a class each, the [Crawler](lib/crawler.rb) and the [Indexer](lib/indexer.rb) came first, and then the [Ranking](lib/ranking.rb) and the [Interface](lib/interface.rb).We organised our stand-ups every morning to catch up to with the rest of the team and understand struggles that we might work as a team.

### Classes
Normally every search engine possesses similar elements in they algorithm in order to work, from Bing to Google.
Here are the classes we created and their algorithm in order to make our search engine work:

- [**Crawler**](lib/crawler.rb):

	1. Initialises with an array of seeds ([URLs](https://en.wikipedia.org/wiki/URL)).
	2. Fetches data from each seed url:
		- All the urls on the page to repopulate the seeds.
		- Keywords provided in the head of the page (given by tag
	  'meta').
		- Description provided in the head of the page (given by tag
	  'meta').
		- All headers on the page (`<h1>` unto `<h6>`).
		- The full text on a page, as a raw string without
	  punctuation (given by tag `<p>`).
	3. Saves all data in a CSV file. Each row in the file is a new
  seed.


- [**Indexer**](lib/indexer.rb):

	1. For each seed, removes all the [stopwords](https://en.wikipedia.org/wiki/Stop_words) from data provided.
	2. [Stems the words](https://en.wikipedia.org/wiki/Word_stem) (e.g. groups together words such as 'fish',
  'fishes', 'fishing', etc.).
	3. Counts amount of time each word is being used from each data
  attribute in a hash [PROVIDE EXAMPLE].
	4. includes the index of the seed, to correlate with the data
  in the CSV.


- [**Ranker**](lib/ranking.rb):

	1. Calculates a score when a query word is provided
	2. Takes in hash provided by the indexer, plus the query
	3. Calculates final score by multiplying the amount of times a
  word is used by a value dependent on where the word is
found.


- *Ranking Multiplier*

| Ranking Factor | Ranking Value |
| --- | --- | --- |--- |
| url | 5 |
| keywords | 4 |
| description | 3 |
| headers | 2 |
| text | 1 |

- *Example:* Query word `spider`. Used in:

| Ranking Factor | Ranking Value | Instances |
| --- | --- | --- |--- |
| url | 5 | 0 |
| keywords | 4 | 2 |
| description | 3 | 1 |
| headers | 2 | 2 |
| text | 1 | 6 |
| **Total Score** | **21**

- [**Interface**](lib/interface.rb):

	1. Interacts with the user
	2. User can give a keyword to search
	3. For each seed a ranker is created, and each ranker calculates the total score relative to the query.
	4. All ranks are placed in an array and sorted by the highest score.
	5. All seed urls are printed in the proposed sorting, highest rank at the top.


## User Stories
#### EPIC
```
As a Person,
So I can expand my knowledge,
I would like to search some websites
```

#### Breakdown
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

## Challenges

One decision we stumble upon was whether which form of database system we wanted to use to store and query information gathered from the seeds, and we have decided as you may have noticed in the project files or the classes to use *CSV files*. The main reason for this was because of time; we expected early in the project that setting up a database such as PostgreSQL would take us quite the amount of time based on our skills, and we had a limit of time to come with an MVP ( 1 week ). Using CSV files also had their trick to store and parse the data correctly as well as testing it took it while as well.

Another challenge, much less important was how many seeds would we want to use in order to define our MVP. We decided that given two seeds would be enough.

> Now that the program is finished we could use **as many seeds as we want!**

Another challenge is regarding the [Crawler](lib/crawler.rb), it repopulates the seeds but it does not visit them. Visiting the seeds could cause the program to run into an infinite loop visiting all the urls possible. This is certainly something that could be optimise.

## Tech Stack

- Plain Ol' Ruby (and some VERY useful gems like [Nokogiri](http://www.nokogiri.org/))

## Collaborators

This **amazing people** helped in the development of this project!

- [Rita Sijelmass](https://github.com/RSijelmass)
- [Aaron Rodrigues](https://github.com/AaronRodrigues)
- [Elena Morton](https://github.com/elenamorton)
