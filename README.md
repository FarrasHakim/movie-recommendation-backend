# Movie Recommendation API Service

Proyek ini dibuat menggunakan SWI-Prolog dalam rangka memenuhi tugas akhir mata kuliah Pemrograman Logika. Proyek ini berperan sebagai service yang menyediakan data movie yang akan digunakan oleh sebuah frontend framework.

#### How to run

1. Clone proyek
2. Pastikan swi-prolog sudah terinstall
3. Buka cmd/terminal di folder 'movie-recommendaiton-backend'
4. Jalankan `swipl -g "server(3001)" web-service.pl`
5. Website dapat diakses melalui browser dengan alamat url `localhost:<port>`

#### Authentication

- API ini menggunakan basic auth
- Salah satu akun authnya adalah Username:admin, Password:admin
- Contoh penggunaan basic auth: `curl -u admin:admin http://localhost:3001/movies`

#### Contoh request yang dapat dijalankan

1. Get All Movies

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

2. Get All Recommended Movies

   Endpoint-URL: `GET /movies/recommended?movie=anna`\
   Input: **Null**

   Output:

   ```
   {
        "list": [
            {
                "desc": "Sick of the neglect he receives from his mom and dad, a young boy leaves home and travels the world in search of new parents.",
                "director": "rob_reiner",
                "genres": [
                    "adventure",
                    "comedy",
                    "drama",
                    "family",
                    "fantasy"
                ],
                "movie": "north",
                "poster": "https://images-na.ssl-images-amazon.com/images/I/81HFtLDPOZL._RI_.jpg",
                "rating": 4.3,
                "year": 1994
            },
            {
                "desc": "A sexually frustrated suburban father has a mid-life crisis after becoming infatuated with his daughter's best friend.",
                "director": "sam_mendes",
                "genres": [
                    "comedy",
                    "drama"
                ],
                "movie": "american_beauty",
                "poster": "https://alternativemovieposters.com/wp-content/uploads/2014/01/americanbeautybg.jpg",
                "rating": 4.6,
                "year": 1999
            },
            {
                "desc": "A young boy in Hitler's army finds out his mother is hiding a Jewish girl in their home.",
                "director": "Taika Waititi",
                "genres": [
                    "comedy",
                    "drama",
                    "war"
                ],
                "movie": "jojo_rabbit",
                "poster": "https://movieden.net/wp-content/uploads/2020/02/jojo-rabbit-1.jpg",
                "rating": 4.6,
                "year": 2019
            }
        ]
    }
   ```

3. Get All Movie Genres

   Endpoint-URL: `GET /movies/genres`\
   Input: **Null**

   Output:

   ```
   {
    "list": [
            "action",
            "adventure",
            "animation",
            "biography",
            "comedy",
            "crime",
            "documentary",
            "drama",
            "family",
            "fantasy",
            "history",
            "horror",
            "music",
            "mystery",
            "romance",
            "scifi",
            "short",
            "sport",
            "thriller",
            "war",
            "western"
        ]
    }
   ```

4. Get Movie Detail

   Endpoint-URL: `GET /movies/detail?name=american_beauty`\
   Input:**NULL**

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
        "genres": [
            "drama",
            "comedy"
        ],
        "moviename": "american_beauty",
        "year": 1999
    }
   ```

5. Filter Movies By Year

   Endpoint-URL: `GET /movies/filter/year?year=1999`\
   Input: **NULL**

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

6. Filter Movies By Genre

   Endpoint-URL: `GET /movies/filter/genre?genre=scifi`\
   Input: **NULL**

   Output:

   ```
   {
    "list": [
            "cq",
            "frankenweenie",
            "ghost_busters",
            "star_wars_episode_i__the_phantom_menace",
            "eight_legged_freaks",
            "the_island"
        ]
    }
   ```

7. Get Movies List Sorted By Year

   Endpoint-URL: `GET /movies/sort/year/asc`\
   Input: **NULL**

   Output:

   ```
   {
        "list": [
            {
                "movie": "the_godfather",
                "year": 1972
            },
            {
                "movie": "the_godfather_part_ii",
                "year": 1974
            },
            {
                "movie": "the_outsiders",
                "year": 1983
            },
            {
                "movie": "rumble_fish",
                "year": 1983
            },
            {
                "movie": "blood_simple",
                "year": 1984
            }
        ]
    }
   ```

8. Get Movies List Sorted By Rating Ascending

   Endpoint-URL: `GET /movies/sort/rating/asc`\
   Input: **NULL**

   Output:

   ```
   {
        "list": [
            {
                "desc": "Sick of the neglect he receives from his mom and dad, a young boy leaves home and travels the world in search of new parents.",
                "director": "rob_reiner",
                "genres": [
                    "adventure",
                    "comedy",
                    "drama",
                    "family",
                    "fantasy"
                ],
                "movie": "north",
                "poster": "https://images-na.ssl-images-amazon.com/images/I/81HFtLDPOZL._RI_.jpg",
                "rating": 3.0,
                "year": 1994
            },
            {
                "desc": "SpongeBob SquarePants takes leave from the town of Bikini Bottom in order to track down King Neptune's stolen crown.",
                "director": "stephen_hillenburg",
                "genres": [
                    "adventure",
                    "action",
                    "comedy",
                    "animation",
                    "family",
                    "fantasy"
                ],
                "movie": "the_spongebob_squarepants_movie",
                "poster": "https://i.pinimg.com/originals/44/36/71/44367117adc04d0ff75a729bcbc364d4.jpg",
                "rating": 4.3,
                "year": 2004
            },
            {
                "desc": "A renowned New York playwright is enticed to California to write for the movies and discovers the hellish truth of Hollywood.",
                "director": "ethan_coen",
                "genres": [
                    "comedy",
                    "thriller",
                    "drama"
                ],
                "movie": "barton_fink",
                "poster": "https://i.pinimg.com/originals/01/be/dc/01bedccab3be4a2a31eded33b420195e.jpg",
                "rating": 4.5,
                "year": 1991
            }
        ]
    }
   ```

9. Add Rating

   Endpoint-URL: `POST /movies/add_rating`\
   Input:

   ```
   {
        "user": "user5",
        "movie": "anna",
        "rating": "4.0"
    }
   ```

   Output:

   ```
    {
        "code": 200,
        "message": "Success"
    }
   ```
