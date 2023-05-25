Rails.application.routes.draw do

  get("/home", {:controller=> "home", :action=>"home"})

  get("/results", {:controller=> "home", :action=> "results"})
  
  get("/playground", {:controller=> "home", :action=> "playground"})
  
  get("/", {:controller=> "home", :action=> "login"})
  
  get("/signup", {:controller=> "home", :action=> "signup"})

end
