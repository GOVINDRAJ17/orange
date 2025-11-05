const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

// In-memory data stores
let users = [];
let rides = [];
let rideParticipants = [];
let rideChats = [];
let notifications = [];
let histories = [];
let payments = [];
let rideCodes = [];
let paymentTransactions = [];

// Helper function to generate ID
let idCounter = 1;
const generateId = () => idCounter++;

// Auth Routes
app.post('/auth/signup', async (req, res) => {
  const { email, password, full_name } = req.body;
  try {
    if (users.find(u => u.email === email)) {
      return res.status(400).json({ error: 'User already exists' });
    }
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = { id: generateId(), email, password_hash: hashedPassword, full_name, created_at: new Date(), updated_at: new Date() };
    users.push(user);
    const token = jwt.sign({ userId: user.id }, 'secretkey', { expiresIn: '1h' });
    res.json({ token, user });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

app.post('/auth/login', async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = users.find(u => u.email === email);
    if (!user || !(await bcrypt.compare(password, user.password_hash))) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
    const token = jwt.sign({ userId: user.id }, 'secretkey', { expiresIn: '1h' });
    res.json({ token, user });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Middleware to verify token
const authMiddleware = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');
  if (!token) return res.status(401).json({ error: 'Access denied' });
  try {
    const verified = jwt.verify(token, 'secretkey');
    req.userId = verified.userId;
    next();
  } catch (error) {
    res.status(400).json({ error: 'Invalid token' });
  }
};

// Rides Routes
app.get('/rides', authMiddleware, async (req, res) => {
  try {
    res.json(rides);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/rides', authMiddleware, async (req, res) => {
  try {
    const ride = { id: generateId(), ...req.body, created_by: req.userId, status: 'active', created_at: new Date(), updated_at: new Date() };
    rides.push(ride);
    res.json(ride);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

// Add more routes as needed...

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
