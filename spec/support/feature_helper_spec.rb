module FeatureHelper
  def mock_auth
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new(
      {
        "provider"=>"instagram",
        "uid"=>"1546672945",
        "info"=>
          {
            "nickname"=>"notfakemarc",
            "name"=>"",
            "image"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
            "bio"=>"",
            "website"=>""
          },
        "credentials"=>{"token"=>ENV["OAUTH_TEST_TOKEN"], "expires"=>false},
        "extra"=>{}
      })
  end

  def log_user_in
    VCR.use_cassette('login') do
      visit root_path
      mock_auth
      click_link "Sign In With Instagram"
    end
  end

  def stub_current_user
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)
  end

  def instagram_api_response
    { "data" =>
    [{"attribution"=>nil,
      "tags"=>["besties"],
      "type"=>"image",
      "location"=>{"latitude"=>39.74962, "longitude"=>-105.000136111},
      "comments"=>{"count"=>0, "data"=>[]},
      "filter"=>"Rise",
      "created_time"=>"1414804420",
      "link"=>"http://instagram.com/p/u1pg_qLgtt/",
      "likes"=>{"count"=>0, "data"=>[]},
      "images"=>
    {"low_resolution"=>
      {"url"=>
        "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731736_396284220521663_1520459156_a.jpg",
          "width"=>306,
          "height"=>306},
          "thumbnail"=>
        {"url"=>
          "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731736_396284220521663_1520459156_s.jpg",
            "width"=>150,
            "height"=>150},
            "standard_resolution"=>
          {"url"=>
            "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731736_396284220521663_1520459156_n.jpg",
              "width"=>640,
              "height"=>640}},
              "users_in_photo"=>[],
              "caption"=>
            {"created_time"=>"1414804420",
              "text"=>"#besties",
              "from"=>
            {"username"=>"notfakemarc",
              "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
              "id"=>"1546672945",
              "full_name"=>"notfakemarc"},
              "id"=>"843763093550795252"},
              "user_has_liked"=>false,
              "id"=>"843763092485442413_1546672945",
              "user"=>
            {"username"=>"notfakemarc",
              "website"=>"",
              "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
              "full_name"=>"notfakemarc",
              "bio"=>"",
              "id"=>"1546672945"}},
              {"attribution"=>nil,
                "tags"=>["dsa"],
                "type"=>"image",
                "location"=>
            {"latitude"=>39.749574,
              "name"=>"Turing School",
              "longitude"=>-104.999971,
              "id"=>451194042},
              "comments"=>{"count"=>0, "data"=>[]},
              "filter"=>"Hefe",
              "created_time"=>"1414772194",
              "link"=>"http://instagram.com/p/u0sDK4LghK/",
              "likes"=>{"count"=>0, "data"=>[]},
              "images"=>
            {"low_resolution"=>
              {"url"=>
                "http://scontent-b.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731669_937281106286155_1849634485_a.jpg",
                  "width"=>306,
                  "height"=>306},
                  "thumbnail"=>
                {"url"=>
                  "http://scontent-b.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731669_937281106286155_1849634485_s.jpg",
                    "width"=>150,
                    "height"=>150},
                    "standard_resolution"=>
                  {"url"=>
                    "http://scontent-b.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731669_937281106286155_1849634485_n.jpg",
                      "width"=>640,
                      "height"=>640}},
                      "users_in_photo"=>[],
                      "caption"=>
                    {"created_time"=>"1414772194",
                      "text"=>"Rolando goes hard in the paint for #DSA morning meetups",
                      "from"=>
                    {"username"=>"notfakemarc",
                      "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
                      "id"=>"1546672945",
                      "full_name"=>"notfakemarc"},
                      "id"=>"843492763737393702"},
                      "user_has_liked"=>false,
                      "id"=>"843492762110003274_1546672945",
                      "user"=>
                    {"username"=>"notfakemarc",
                      "website"=>"",
                      "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
                      "full_name"=>"notfakemarc",
                      "bio"=>"",
                      "id"=>"1546672945"}}]
    }
  end

  def twitter_api_response
    [{"created_at"=>"Mon Nov 10 21:31:04 +0000 2014",
      "id"=>531922010872377344,
      "id_str"=>"531922010872377344",
      "text"=>"demo #2",
      "source"=>"<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
      "truncated"=>false,
      "in_reply_to_status_id"=>nil,
      "in_reply_to_status_id_str"=>nil,
      "in_reply_to_user_id"=>nil,
      "in_reply_to_user_id_str"=>nil,
      "in_reply_to_screen_name"=>nil,
      "user"=>
    {"id"=>2895994081,
      "id_str"=>"2895994081",
      "name"=>"Fake Marc",
      "screen_name"=>"marcgaro",
      "location"=>"",
      "profile_location"=>nil,
      "description"=>"",
      "url"=>nil,
      "entities"=>{"description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>0,
      "friends_count"=>0,
      "listed_count"=>0,
      "created_at"=>"Mon Nov 10 21:23:45 +0000 2014",
      "favourites_count"=>0,
      "utc_offset"=>nil,
      "time_zone"=>nil,
      "geo_enabled"=>false,
      "verified"=>false,
      "statuses_count"=>2,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"C0DEED",
      "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_tile"=>false,
      "profile_image_url"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
      "profile_image_url_https"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
      "profile_link_color"=>"0084B4",
      "profile_sidebar_border_color"=>"C0DEED",
      "profile_sidebar_fill_color"=>"DDEEF6",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>true,
      "default_profile_image"=>true,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
      "geo"=>nil,
      "coordinates"=>nil,
      "place"=>nil,
      "contributors"=>nil,
      "retweet_count"=>0,
      "favorite_count"=>0,
      "entities"=>{"hashtags"=>[], "symbols"=>[], "user_mentions"=>[], "urls"=>[]},
      "favorited"=>false,
      "retweeted"=>false,
      "lang"=>"es"},
      {"created_at"=>"Mon Nov 10 21:30:54 +0000 2014",
        "id"=>531921968975446016,
        "id_str"=>"531921968975446016",
        "text"=>"demo #1",
        "source"=>"<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
        "truncated"=>false,
        "in_reply_to_status_id"=>nil,
        "in_reply_to_status_id_str"=>nil,
        "in_reply_to_user_id"=>nil,
        "in_reply_to_user_id_str"=>nil,
        "in_reply_to_screen_name"=>nil,
        "user"=>
    {"id"=>2895994081,
      "id_str"=>"2895994081",
      "name"=>"Fake Marc",
      "screen_name"=>"marcgaro",
      "location"=>"",
      "profile_location"=>nil,
      "description"=>"",
      "url"=>nil,
      "entities"=>{"description"=>{"urls"=>[]}},
      "protected"=>false,
      "followers_count"=>0,
      "friends_count"=>0,
      "listed_count"=>0,
      "created_at"=>"Mon Nov 10 21:23:45 +0000 2014",
      "favourites_count"=>0,
      "utc_offset"=>nil,
      "time_zone"=>nil,
      "geo_enabled"=>false,
      "verified"=>false,
      "statuses_count"=>2,
      "lang"=>"en",
      "contributors_enabled"=>false,
      "is_translator"=>false,
      "is_translation_enabled"=>false,
      "profile_background_color"=>"C0DEED",
      "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
      "profile_background_tile"=>false,
      "profile_image_url"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
      "profile_image_url_https"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
      "profile_link_color"=>"0084B4",
      "profile_sidebar_border_color"=>"C0DEED",
      "profile_sidebar_fill_color"=>"DDEEF6",
      "profile_text_color"=>"333333",
      "profile_use_background_image"=>true,
      "default_profile"=>true,
      "default_profile_image"=>true,
      "following"=>false,
      "follow_request_sent"=>false,
      "notifications"=>false},
      "geo"=>nil,
      "coordinates"=>nil,
      "place"=>nil,
      "contributors"=>nil,
      "retweet_count"=>0,
      "favorite_count"=>0,
      "entities"=>{"hashtags"=>[], "symbols"=>[], "user_mentions"=>[], "urls"=>[]},
      "favorited"=>false,
      "retweeted"=>false,
      "lang"=>"es"}]
  end

end
