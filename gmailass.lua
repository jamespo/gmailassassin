options.certificates = false

dofile(os.getenv("HOME") .. "/.private/imapfilter/gmailcreds.lua")


all = gmaccount.INBOX:is_unseen()

spams = Set {}
for _, mesg in ipairs(all) do
    mbox, uid = table.unpack(mesg)
    text = mbox[uid]:fetch_message()
    if (pipe_to('spamc -E', text) == 1) then
        table.insert(spams, mesg)
    end
end

spams:move_messages(gmaccount['[Gmail]/Spam'])
