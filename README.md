# search_engine

#### Flow

Crawler: initialises with array of seeds

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
