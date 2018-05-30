def post_to_facebook_feed(message, action_links)
  facebook_session.user.publish_to(facebook_session.user, 
                                  :message => message, 
                                  :action_links => action_links)
end
## In case of exception this will throw 500 error to client
"""
Solution for handling exception with above scenario
"""
def post_to_facebook_feed(message, action_links)
  facebook_session.user.publish_to(facebook_session.user, 
                                  :message => message, 
                                  :action_links => action_links)
rescue
end
# This will rescue against all exception, which is bad

"""
A proper rescuing strategy
"""
def post_to_facebook_feed(message, action_links)
  facebook_session.user.publish_to(facebook_session.user, 
                                  :message => message, 
                                  :action_links => action_links)
rescue *FACEBOOK_ERRORS => facebook_error
  HoptoadNotifier.notify facebook_error
end

FACEBOOK_ERRORS = [Facebooker::NonSessionUser,
                  Facebooker::Session::SessionExpired, 
                  Facebooker::Session::UnknownError, 
                  Facebooker::Session::ServiceUnavailable, 
                  Facebooker::Session::MaxRequestsDepleted, 
                  Facebooker::Session::HostNotAllowed, 
                  Facebooker::Session::MissingOrInvalidParameter, 
                  Facebooker::Session::InvalidAPIKey, 
                  Facebooker::Session::CallOutOfOrder, 
                  Facebooker::Session::IncorrectSignature, 
                  Facebooker::Session::SignatureTooOld, 
                  Facebooker::Session::TooManyUserCalls, 
                  Facebooker::Session::TooManyUserActionCalls, 
                  Facebooker::Session::InvalidFeedTitleLink, 
                  Facebooker::Session::InvalidFeedTitleLength, 
                  Facebooker::Session::InvalidFeedTitleName, 
                  Facebooker::Session::BlankFeedTitle, 
                  Facebooker::Session::FeedBodyLengthTooLong]

"""
Rescue in case of HTTP exception
"""
HTTP_ERRORS = [Timeout::Error,
              Errno::EINVAL, 
              Errno::ECONNRESET, 
              EOFError, 
              Net::HTTPBadResponse, 
              Net::HTTPHeaderSyntaxError, 
              Net::ProtocolError]

begin 
  req = Net::HTTP::Post.new(url.path) 
  req.set_form_data({'xml' => xml}) 
  http = Net::HTTP.new(url.host, url.port).start 
  response = http.request(req) 
rescue *HTTP_ERRORS => e 
  HoptoadNotifier.notify e 
end

"""
Rescue for Mail Delivery error
"""

SMTP_SERVER_ERRORS = [TimeoutError,
                      IOError,
                      Net::SMTPUnknownError,
                      Net::SMTPServerBusy,
                      Net::SMTPAuthenticationError]

SMTP_CLIENT_ERRORS = [Net::SMTPFatalError, 
                      Net::SMTPSyntaxError]

def notify_of_action(user, action) 
  begin 
    Mailer.action_notification(user, action).deliver 
  rescue *SMTP_CLIENT_EXCEPTIONS 
    flash[:warning] = "There was an issue delivering your 
                        notification. Please check the 
                        notification list settings."
  rescue *SMTP_SERVER_EXCEPTIONS => e 
    HoptoadNotifier.notify e 
  end 
end