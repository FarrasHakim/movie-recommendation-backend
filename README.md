# Movie Recommendation API Service

Proyek ini dibuat menggunakan SWI-Prolog dalam rangka memenuhi tugas akhir mata kuliah Pemrograman Logika. Proyek ini berperan sebagai service yang menyediakan data movie yang akan digunakan oleh sebuah frontend framework.

#### How to run

1. Clone proyek
2. Pastikan swi-prolog sudah terinstall
3. Buka cmd/terminal di folder 'movie-recommendaiton-backend'
4. Jalankan `swipl -g "server(8000)" web-service.pl`
5. Website dapat diakses melalui browser dengan alamat url `localhost:<port>`

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
2. Get All Movie Genres

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

3. Get Movie Detail

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

4. Filter Movies By Year

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

5. Filter Movies By Genre

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

6. Get Movies List Sorted By Year

   Endpoint-URL: `GET /movies/sort/year`\
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
            },
            {
                "movie": "the_cotton_club",
                "year": 1984
            },
            {
                "movie": "frankenweenie",
                "year": 1984
            },
            {
                "movie": "ghost_busters",
                "year": 1984
            },
            {
                "movie": "crimewave",
                "year": 1985
            },
            {
                "movie": "spies_like_us",
                "year": 1985
            },
            {
                "movie": "peggy_sue_got_married",
                "year": 1986
            },
            {
                "movie": "anna",
                "year": 1987
            },
            {
                "movie": "raising_arizona",
                "year": 1987
            },
            {
                "movie": "the_godfather_part_iii",
                "year": 1990
            },
            {
                "movie": "miller_s_crossing",
                "year": 1990
            },
            {
                "movie": "barton_fink",
                "year": 1991
            },
            {
                "movie": "hearts_of_darkness_a_filmmaker_s_apocalypse",
                "year": 1991
            },
            {
                "movie": "inside_monkey_zetterland",
                "year": 1992
            },
            {
                "movie": "the_firm",
                "year": 1993
            },
            {
                "movie": "groundhog_day",
                "year": 1993
            },
            {
                "movie": "the_hudsucker_proxy",
                "year": 1994
            },
            {
                "movie": "north",
                "year": 1994
            },
            {
                "movie": "the_usual_suspects",
                "year": 1995
            },
            {
                "movie": "just_cause",
                "year": 1995
            },
            {
                "movie": "fargo",
                "year": 1996
            },
            {
                "movie": "mission_impossible",
                "year": 1996
            },
            {
                "movie": "if_lucy_fell",
                "year": 1996
            },
            {
                "movie": "manny__lo",
                "year": 1996
            },
            {
                "movie": "blade_runner",
                "year": 1997
            },
            {
                "movie": "fall",
                "year": 1997
            },
            {
                "movie": "home_alone_3",
                "year": 1997
            },
            {
                "movie": "the_big_lebowski",
                "year": 1998
            },
            {
                "movie": "lick_the_star",
                "year": 1998
            },
            {
                "movie": "the_horse_whisperer",
                "year": 1998
            },
            {
                "movie": "american_beauty",
                "year": 1999
            },
            {
                "movie": "star_wars_episode_i__the_phantom_menace",
                "year": 1999
            },
            {
                "movie": "torrance_rises",
                "year": 1999
            },
            {
                "movie": "the_virgin_suicides",
                "year": 1999
            },
            {
                "movie": "my_brother_the_pig",
                "year": 1999
            },
            {
                "movie": "down_from_the_mountain",
                "year": 2000
            },
            {
                "movie": "o_brother_where_art_thou",
                "year": 2000
            },
            {
                "movie": "ghost_world",
                "year": 2000
            },
            {
                "movie": "cq",
                "year": 2001
            },
            {
                "movie": "the_man_who_wasn_t_there",
                "year": 2001
            },
            {
                "movie": "an_american_rhapsody",
                "year": 2001
            },
            {
                "movie": "eight_legged_freaks",
                "year": 2002
            },
            {
                "movie": "girl_with_a_pearl_earring",
                "year": 2003
            },
            {
                "movie": "intolerable_cruelty",
                "year": 2003
            },
            {
                "movie": "lost_in_translation",
                "year": 2003
            },
            {
                "movie": "the_ladykillers",
                "year": 2004
            },
            {
                "movie": "a_good_woman",
                "year": 2004
            },
            {
                "movie": "in_good_company",
                "year": 2004
            },
            {
                "movie": "a_love_song_for_bobby_long",
                "year": 2004
            },
            {
                "movie": "the_perfect_score",
                "year": 2004
            },
            {
                "movie": "the_spongebob_squarepants_movie",
                "year": 2004
            },
            {
                "movie": "the_island",
                "year": 2005
            },
            {
                "movie": "match_point",
                "year": 2005
            },
            {
                "movie": "hail_caesar",
                "year": 2006
            },
            {
                "movie": "marie_antoinette",
                "year": 2006
            },
            {
                "movie": "paris_je_t_aime",
                "year": 2006
            },
            {
                "movie": "the_black_dahlia",
                "year": 2006
            },
            {
                "movie": "untitled_woody_allen_fall_project_2006",
                "year": 2006
            },
            {
                "movie": "no_country_for_old_men",
                "year": 2007
            },
            {
                "movie": "jojo_rabbit",
                "year": 2019
            }
        ]
    }
   ```
