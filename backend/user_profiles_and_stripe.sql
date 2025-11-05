_id: "<user_uuid>",
email: "<email>",
password_hash: "<hash>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

user_profiles
{
_id: "<user_uuid>", // aligned with users._id
id: "<user_uuid>", // optional if you want a separate id field
email: "<email>",
full_name: "<name>",
phone_number: "<phone>",
avatar_url: "<url>",
stripe_customer_id: "<stripe_id>",
created_at: ISODate(...),
updated_at: ISODate(...)
}

payment_transactions
{
_id: "<uuid>",
user_id: "<user_uuid>",
ride_id: "<ride_uuid>" or null,
amount: <int>, // in minor units
currency: "INR",
status: "<pending|completed|failed|refunded>",
stripe_payment_intent_id: "<id>",
stripe_payment_method: "<method>",
metadata: <object>,
created_at: ISODate(...),
updated_at: ISODate(...)
}

