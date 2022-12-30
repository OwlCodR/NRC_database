# 🏃 Nike Run Club Database
> That's a university laboratory work.
> It's not real Nike's database but my vision of main concepts of it and how could be designed small part of it.

## 🚀 Tasks
- [x] Create database scheme `chemas/`
- [x] Make tables in PostgreSQL `database/`
- [x] Fill them with generated data
- [ ] Make 15 SQL requests

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
- [x] `biometrics(INT count, INT min, INT max)` - Fills biometrics table for `count` random trainings with N metrics in range

### 📎 Make 15 SQL requests
1. Get all followers by user id
2. Get all users who liked post by id
3. Get all trainings by sport type
5. Get all users by event id
6. Get all posts by title entry
7. Get all posts by date
8. Get all posts by author id
9. Get all biometrics by training id and date 
10. Get all calories by training

### 📦 I worked with
- PgAdmin4
- PostgreSQL
- [DB Designer](https://app.dbdesigner.net)
