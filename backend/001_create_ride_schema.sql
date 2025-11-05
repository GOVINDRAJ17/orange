_id: "<ride_id>",
created_by: "<user_id>",
title: "<text>",
origin: "<text>",
destination: "<text>",
departure_time: ISODate(...),
total_seats: <int>,
seats_left: <int>,
price_per_seat: <int>,
ride_code: "<code>",
status: "<active|completed|cancelled>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

ride_participants
{
_id: "<participant_id>",
ride_id: "<ride_id>",
user_id: "<user_id>",
join_code: "<text>",
amount_due: <int>,
amount_paid: <int>,
paid: <boolean>,
stripe_session_id: "<text>",
payment_intent_id: "<text>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

ride_chats
{
_id: "<chat_id>",
ride_id: "<ride_id>",
user_id: "<user_id>",
type: "<text|audio>",
content: "<text>",
audio_url: "<text>",
created_at: ISODate(...)
}

notifications
{
_id: "<notification_id>",
user_id: "<user_id>",
type: "<ride_joined|ride_created|payment_received|chat_message>",
title: "<text>",
body: "<text>",
ride_id: "<ride_id>",
meta: <object>,
read: <boolean>,
created_at: ISODate(...)
}

history
{
_id: "<history_id>",
user_id: "<user_id>",
ride_id: "<ride_id>",
action: "<create_ride|join_ride|payment|chat_message>",
meta: <object>,
created_at: ISODate(...)
}

payments
{
_id: "<payment_id>",
user_id: "<user_id>",
ride_id: "<ride_id>",
amount: <int>,
currency: "INR",
stripe_session_id: "<text>",
stripe_payment_intent_id: "<text>",
status: "<pending|completed|failed|refunded>",
metadata: <object>,
created_at: ISODate(...),
updated_at: ISODate(...)
}

ride_codes
{
_id: "<code_id>",
ride_id: "<ride_id>",
code: "<text>",
created_at: ISODate(...)
}