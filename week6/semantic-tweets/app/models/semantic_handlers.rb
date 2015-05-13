class SessionCallbackHandler < Semantria::CallbackHandler
    def onRequest(sender, args)
      print "Request: ", args, "\n"
    end
      
    def onResponse(sender, args)
      print "Response: ", args, "\n"
    end
      
    def onError(sender, args)
      print 'Error: ', args, "\n"
    end
      
    def onDocsAutoResponse(sender, args)
      print "DocsAutoResponse: ", args.length, args, "\n"
    end
      
    def onCollsAutoResponse(sender, args)
      print "CollsAutoResponse: ", args.length, args, "\n"
    end
end
