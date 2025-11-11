package com.cineman.servlet;

import com.cineman.dao.MovieDAO;
import com.cineman.model.Movie;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/movie")
public class MovieServlet extends HttpServlet {
    private MovieDAO movieDAO;
    private Gson gson;

    @Override
    public void init() {
        movieDAO = new MovieDAO();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            request.getRequestDispatcher("/WEB-INF/jsp/SearchMovieFrm.jsp").forward(request, response);
            return;
        }
        
        if ("viewDetail".equals(action)) {
            viewMovieDetail(request, response);
            return;
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        if ("search".equals(action)) {
            searchMovie(request, response);
        } else if ("detail".equals(action)) {
            getMovieDetail(request, response);
        } else if ("all".equals(action)) {
            getAllMovies(request, response);
        } else {
            response.getWriter().write("{\"error\": \"Invalid action\"}");
        }
    }

    private void searchMovie(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        String movieName = request.getParameter("Name");
        
        if (movieName != null && !movieName.trim().isEmpty()) {
            List<Movie> movies = movieDAO.findMovieByName(movieName);
            String json = gson.toJson(movies);
            response.getWriter().write(json);
        } else {
            response.getWriter().write("[]");
        }
    }

    private void getMovieDetail(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        String idStr = request.getParameter("idMovie");
        
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                
                Movie movie = movieDAO.findMovieById(id);
                if (movie != null) {
                    String json = gson.toJson(movie);
                    response.getWriter().write(json);
                } else {
                    response.getWriter().write("{\"error\": \"Movie not found\"}");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"error\": \"Invalid movie ID\"}");
            }
        } else {
            response.getWriter().write("{\"error\": \"Missing movie ID\"}");
        }
    }
    private void getAllMovies(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        List<Movie> movies = movieDAO.getAllMovies();
        String json = gson.toJson(movies);
        response.getWriter().write(json);
    }
    
    private void viewMovieDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/InformationDetailFrm.jsp").forward(request, response);
    }
}

