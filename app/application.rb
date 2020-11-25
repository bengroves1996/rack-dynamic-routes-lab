class Application

    @@items = []
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path != "/items/&lt;ITEM NAME>"
        resp.write "Route not found"
        resp.status = 404
      elsif req.path.match('/items/&lt;ITEM NAME>')
        @@items.each do |item|
            added = req.params["item"]
            resp.write adds(added)
        end
      else 
        resp.write "Item requested is not availible"
        resp.status = 400
    

      end
      resp.finish
    end 

    def adds(added)
        if @@items.include?(added)
          return "#{added.price}"
        else
          return "We don't have that item."
        end
    end
  end 