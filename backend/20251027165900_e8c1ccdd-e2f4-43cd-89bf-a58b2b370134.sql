{
_id: "<profile_id>",
full_name: "<name>",
phone: "<phone>",
avatar_url: "<url>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

rides
{
_id: "<ride_id>",
created_by: "<user_id>",
ride_type: "<book|offer>",
pickup_location: "<text>",
dropoff_location: "<text>",
departure_time: ISODate(...),
seats_available: <int>,
seats_left: <int>,
price_per_seat: <int>,
ride_code: "<code>",
status: "<active|completed|cancelled>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

schedules
{
_id: "<schedule_id>",
user_id: "<user_id>",
from_location: "<text>",
to_location: "<text>",
scheduled_date: ISODate(...),
status: "<confirmed|pending|cancelled>",
notes: "<text>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

ride_participants
(as above)

ride_chats
(as above)

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
stripe_session_id: "<id>",
stripe_payment_intent_id: "<id>",
status: "<pending|completed|failed|refunded>",
metadata: <object>,
created_at: ISODate(...),
updated_at: ISODate(...)
}

ride_codes
{
_id: "<code_id>",
ride_id: "<ride_id>",
code: "<string>",
created_at: ISODate(...)
}

