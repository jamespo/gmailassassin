options.certificates = false

dofile(os.getenv("HOME") .. "/.private/imapfilter/gmailcreds.lua")


all = myaccount.mymailbox:select_all()

results = Set {}
for _, mesg in ipairs(all) do
    mbox, uid = table.unpack(mesg)
    text = mbox[uid]:fetch_message()
    if (pipe_to('bayesian-spam-filter', text) == 1) then
        table.insert(results, mesg)
    end
end

results:delete_messages()
