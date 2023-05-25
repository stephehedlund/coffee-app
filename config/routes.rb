Rails.application.routes.draw do

  get("/discover", {:controller=> "home", :action=>"discover"})

  get("/results", {:controller=> "home", :action=> "results"})
  
  get("/playground", {:controller=> "home", :action=> "playground"})
  
  get("/", {:controller=> "home", :action=> "login"})
  
  get("/signup", {:controller=> "home", :action=> "signup"})

  get("/results/save/:shop_id", {:controller=> "home", :action=> "bookmark"})

end
