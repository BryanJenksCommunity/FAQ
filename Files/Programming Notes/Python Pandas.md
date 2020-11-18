# Python Pandas
#✅️ 

```python
# Libs
import pandas as pd

# Instead of using CSV module this can make a dataframe out of your csv file
df = pd.read_csv('data.csv')

# Preview of our data
df.head(10)

# Preview of our data
df.tail(10)

# Get the shape of the data frame (Rows, Columns)
# Attribute not a method so no parens needed
df.shape

# Get info about the data frame fields
# This is a method so parens are needed
# Object types are usually strings
df.info()

# makes is so the printed dataframe above with the `df` call cell displays 85 total columns
pd.set_option('display.max_columns',85)
# makes is so the printed dataframe above with the `df` call cell displays 85 total rows
pd.set_option('display.max_rows',85)

# Load csv schema
schema_df = pd.read_csv('data_schema.csv')

schema_df
```

```python
#!/usr/bin/env python
# coding: utf-8

# # Pandas tutorial with Stackoverflow data
# 
# > This tutorial is using data from the stack overflow developer survey that can be found at the following link:
# [Developer Survey List](https://insights.stackoverflow.com/survey)
# Libs
import pandas as pd
# Instead of using CSV module this can make a dataframe out of your csv file
df = pd.read_csv('data.csv')
# Preview of our data
df.head(10)
# Preview of our data
df.tail(10)
# Get the shape of the data frame (Rows, Columns)
# Attribute not a method so no parens needed
df.shape
# Get info about the data frame fields
# This is a method so parens are needed
# Object types are usually strings
df.info()
# makes is so the printed dataframe above with the `df` call cell displays 85 total columns
pd.set_option('display.max_columns',85)
# makes is so the printed dataframe above with the `df` call cell displays 85 total rows
pd.set_option('display.max_rows',85)
# Load csv schema
schema_df = pd.read_csv('data_schema.csv')
schema_df
df['Hobbyist']
people = {
    "first": ["Corey", 'Jane', 'John'], 
    "last": ["Schafer", 'Doe', 'Doe'], 
    "email": ["CoreyMSchafer@gmail.com", 'JaneDoe@email.com', 'JohnDoe@email.com']
}
people['email']
peeps = pd.DataFrame(people)
peeps
peeps['email']
peeps.email
peeps[['last','email']]
peeps.columns
# loc = location
# iloc = integer location
peeps.iloc[[0, 1], 2] # return the first and second record and only the 3rd field of those records
df['email']
df.Hobbyist.value_counts()
# # Video #3
# ## Python Pandas Tutorial (Part 3): Indexes - How to Set, Reset, and Use Indexes
# 
#[video3](https://youtu.be/W9XjRYFkkyw?list=PL-osiE80TeTsWmV9i9c58mdDCSskIFdDS)
# 
people = {
    "first": ["Corey", 'Jane', 'John'], 
    "last": ["Schafer", 'Doe', 'Doe'], 
    "email": ["CoreyMSchafer@gmail.com", 'JaneDoe@email.com', 'JohnDoe@email.com']
}
df = pd.DataFrame(people)
df.set_index('email')
df
df.set_index('email', inplace=True) # make it so changes overwrite the df
df
df.loc['CoreyMSchafer@gmail.com']
df.iloc[0]
get_ipython().run_line_magic('lsmagic', '')
get_ipython().run_cell_magic('html', '', '<b>hello there</b>')
get_ipython().run_cell_magic('bash', '', 'ls -la')
get_ipython().run_line_magic('ls', '-la')
get_ipython().run_line_magic('ls', '-la')
get_ipython().run_line_magic('ls', '-la')

```