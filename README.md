# 🏃 Nike Run Club Database
> That's a university laboratory work.
> It's not real Nike's database but my vision of main concepts of it and how could be designed small part of it.

## 🚀 Tasks
- [x] Create database scheme `schemas/`
- [x] Make tables in PostgreSQL `database/`
- [x] Fill them with generated data
- [x] Make 10 SQL requests `requests/`

### ✨ Create database scheme
> First of all we need to make feature-list
- There are users (Millions)
- Users can folow on each other
- User can make posts. Others may like it
- User can start training with different sport types
- User can make sport event where other people can take part in
- User may have a smart-band which can send biometrics data during the training

### 📄 Make tables in PostgreSQL
> Just made create.sql and drop.sql scripts from scheme and inserted it into PgAdmin4

### 💾 Fill them with generated data
> Firstly, let's decide which kind of data we want to see
- `TEXT` Readable words and sentences like Lorem Ipsum
- `REAL, INT` Random values in some ranges
- `TIMESTAMP` Random from some period of time (with intervals)
> I didn't find any light-weight and simple to install on MacOS libraries to generate fake data.
> But it's not so difficult, so I can do it by myself using SQL functions
- [x] `pos()` - Returns random position (longitude or latitude)
- [x] `gender()` - Returns 'Male' or 'Female'
- [x] `name()` - Returns random name
- [x] `surname()` - Returns random name
- [x] `sentence()` - Returns random sentence 
- [x] `birthday()` - Returns random birthday date
- [x] `paragraph(INT count)` - Returns random text with *count* sentences 
- [x] `rand_int(INT min, INT max)` - Returns random int in range
- [x] `rand_real(REAL min, REAL max)` - Returns random real in range
- [x] `rand_timestamp(BOOLEAN future, INT min, INT max)` - Returns timestamp date in future or not with offset in range
- [x] `rand_interval(BOOLEAN future, TEXT units, INT min, INT max)` - Returns random interval in range in future or not with units
- [x] `rand_id_from(TEXT table, INT min, INT max, INT retries)` - Returns random id from table in range. If id does not exist will retry N times
- [x] `biometrics(INT count, INT min, INT max)` - Fills biometrics table for *count* random trainings with N metrics in range

### 📎 Make 15 SQL requests
1. Get all followers by user id
2. Get posts count for the last week
3. Get name and surname of all users who liked post by id
4. Get the most popular sport type
5. Get all posts by title entry
6. Get authors of posts of the last 2 days
7. Get info about the biggest event by amount of subscribers
8. Get average amount of post likes of the user with max followers count
9. Set status by trainings count for all followers of the user with max followers count
`n == 0` - Unsportsmanlike
`1 <= n <= 4` - Amateur Athlete
`n > 4` - Sportsman
10. Get info about training with max heartrate for every user where training type is "Treadmill"

### 📦 I worked with
- PgAdmin4
- PostgreSQL
- [DB Designer](https://app.dbdesigner.net)
