package com.cineman.dao;


import com.cineman.model.Movie;
import java.sql.*;
import java.util.*;

public class MovieDAO extends DAO {

    public MovieDAO() {
        super();
    }

    public List<Movie> findMovieByName(String name) {
        if (name == null || name.trim().isEmpty()) {
            return Collections.emptyList();
        }
        List<Movie> result = new ArrayList<>();
        String sql = "SELECT id, name, genre, duration, language, description, releaseDate FROM movie WHERE LOWER(name) LIKE ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + name.trim().toLowerCase() + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Movie m = extractMovieFromResultSet(rs);
                    result.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public Movie findMovieById(int id) {
        String sql = "SELECT id, name, genre, duration, language, description, releaseDate FROM movie WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractMovieFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT id, name, genre, duration, language, description, releaseDate FROM movie ORDER BY name";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Movie m = extractMovieFromResultSet(rs);
                    movies.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    private Movie extractMovieFromResultSet(ResultSet rs) throws SQLException {
        Movie m = new Movie();
        m.setId(rs.getInt("id"));
        m.setName(rs.getString("name"));
        m.setGenre(rs.getString("genre"));
        m.setDuration(rs.getInt("duration"));
        m.setLanguage(rs.getString("language"));
        m.setDescription(rs.getString("description"));
        
        java.sql.Date sqlDate = rs.getDate("releaseDate");
        if (sqlDate != null) {
            m.setReleaseDate(new java.util.Date(sqlDate.getTime()));
        }
        
        return m;
    }
}
