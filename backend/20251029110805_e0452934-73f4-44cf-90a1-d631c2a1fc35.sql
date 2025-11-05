_id: "<profile_id_uuid>" (often same as user id),
full_name: "<name>",
phone: "<phone>",
avatar_url: "<url>",
created_at: ISODate(...),
updated_at: ISODate(...)


rides
{
_id: "<ride_id_uuid>",
user_id: "<owner_user_id>",
ride_type: "<book|offer>",
pickup_location: "<text>",
dropoff_location: "<text>",
ride_date: ISODate("..."),
seats_available: <int>,
vehicle_details: "<text>",
fare_estimate: <number>,
ride_mode: "<solo|shared>",
status: "<pending|confirmed|completed|cancelled>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

ride_participants
{
_id: "<participant_id_uuid>",
ride_id: "<ride_id_uuid>",
user_id: "<user_id_uuid>",
role: "<passenger|driver?>",
joined_at: ISODate(...)
// additional fields as in SQL
}

ride_chat_messages
{
_id: "<message_id_uuid>",
ride_id: "<ride_id_uuid>",
sender_id: "<user_id_uuid>",
message_text: "<text>",
created_at: ISODate(...),
audio_url: "<url>"
}

split_payments
{
_id: "<split_id_uuid>",
creator_id: "<user_id_uuid>",
total_amount: <decimal>,
participants: <array>, // embed or reference
ride_id: "<ride_id_uuid>",
status: "<pending|completed|cancelled>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

