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
4. Get Movies By Name
   Endpoint-URL: `POST /movies/by-name/`\
   Input:
   ```
   {
       "name":"american_beauty"
   }
   ```
   Output:
   ```
   {
    "actors": [
            "kevin_spacey",
            "wes_bentley",
            "chris_cooper",
            "peter_gallagher",
            "scott_bakula",
            "sam_robards",
            "barry_del_sherman",
            "john_cho",
            "fort_atkinson",
            "kent_faulcon",
            "joel_mccrary",
            "dennis_anderson",
            "matthew_kimbrough",
            "annette_bening",
            "thora_birch",
            "mena_suvari",
            "allison_janney",
            "ara_celi",
            "sue_casey",
            "brenda_wehle",
            "lisa_cloud",
            "alison_faulk",
            "krista_goodsitt",
            "lily_houtkin",
            "carolina_lancaster",
            "romana_leah",
            "chekeshka_van_putten",
            "emily_zachary",
            "nancy_anderson",
            "reshma_gajjar",
            "stephanie_rizzo",
            "heather_joy_sher",
            "chelsea_hertford",
            "amber_smith",
            "marissa_jaret_winokur",
            "erin_cathryn_strubbe",
            "elaine_corral_kendall"
        ],
        "moviename": "american_beauty",
        "year": 1999
    }
   ```