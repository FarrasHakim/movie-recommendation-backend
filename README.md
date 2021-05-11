# Movie Recommendation API Service
Proyek ini dibuat menggunakan SWI-Prolog dalam rangka memenuhi tugas akhir mata kuliah Pemrograman Logika. Proyek ini berperan sebagai service yang menyediakan data movie yang akan digunakan oleh sebuah frontend framework.

#### How to run
1. Clone proyek
2. Pastikan swi-prolog sudah terinstall
3. Buka cmd/terminal di folder 'movie-recommendaiton-backend'
4. Jalankan `swipl web-service.pl`
5. SWI-Prolog akan berjalan di cmd/terminal
6. Jalankan syntax `server(<port>)`
7. Website dapat diakses melalui browser dengan alamat url `localhost:<port>` 

#### Contoh request yang dapat dijalankan
1. "Get" Movies
   Endpoint-URL: `GET /movies`\
   Input: **Null**

   Output:
   ```
   {
       "list":[
           "american_beauty",
            "anna",
            "barton_fink",
            "the_big_lebowski",
            "blade_runner",
            "blood_simple",
            "the_cotton_club"
       ]
   }
   ```

2. Add Number
   Endpoint-URL: `POST /add`\
   Input:
   ```
   {
       "a": 12,
       "b": 13
   }
   ```

   Output:
   ```
   {
      "answer": 25
   }
   ```
3. Get Movies By Year
   Endpoint-URL: `POST /movies/filter-by-year/`\
   Input:
   ```
   {
       "year":1999
   }
   ```
   Output:
   ```
   {
    "list": [
            "american_beauty",
            "star_wars_episode_i__the_phantom_menace",
            "torrance_rises",
            "the_virgin_suicides",
            "my_brother_the_pig"
        ]
    }
   ```