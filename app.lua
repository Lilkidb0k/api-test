local http = require('http')
local json = require('json')

local server = http.createServer(function (req, res)
    local url = req.url
    res:setHeader('Content-Type', 'application/json')

    if url == "/" then
        res:finish(json.encode({ message = "Welcome to my Luvit API!" }))

    elseif url:match("^/greet") then
        local name = url:match("name=([^&]+)") or "guy"
        res:finish(json.encode({ message = "Hello, " .. name .. "!" }))

    else
        res.statusCode = 404
        res:finish(json.encode({ error = "Not Found" }))
    end
end)

server:listen(8080)
print("Server running at http://localhost:8080/")