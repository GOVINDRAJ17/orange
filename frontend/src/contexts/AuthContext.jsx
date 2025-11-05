import { createContext, useContext, useEffect, useState } from "react";
import { api } from "@/lib/api";
import PropTypes from 'prop-types';

const AuthContext = createContext(undefined);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [token, setToken] = useState(localStorage.getItem('token'));
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (token) {
      // Optionally verify token or set user
      setUser({ id: 1, email: 'user@example.com' }); // Placeholder, adjust as needed
    }
    setLoading(false);
  }, [token]);

  const signUp = async (email, password, full_name) => {
    try {
      const result = await api.auth.signup({ email, password, full_name });
      if (result.token) {
        setToken(result.token);
        localStorage.setItem('token', result.token);
        setUser(result.user);
      }
      return result;
    } catch (error) {
      throw error;
    }
  };

  const signIn = async (email, password) => {
    try {
      const result = await api.auth.login({ email, password });
      if (result.token) {
        setToken(result.token);
        localStorage.setItem('token', result.token);
        setUser(result.user);
      }
      return result;
    } catch (error) {
      throw error;
    }
  };

  const signOut = async () => {
    setUser(null);
    setToken(null);
    localStorage.removeItem('token');
  };

  return (
    <AuthContext.Provider value={{ user, token, loading, signIn, signUp, signOut }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within AuthProvider");
  }
  return context;
};

AuthProvider.propTypes = {
  children: PropTypes.node.isRequired
};
