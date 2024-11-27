package com.infosys.movieSystem.controller;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.infosys.movieSystem.bean.Movie;
import com.infosys.movieSystem.bean.MovieShow;
import com.infosys.movieSystem.bean.MovieShowDTO;
import com.infosys.movieSystem.bean.MovieShowEmbed;
import com.infosys.movieSystem.bean.MovieUser;
import com.infosys.movieSystem.bean.ShowTime;
import com.infosys.movieSystem.dao.MovieDao;
import com.infosys.movieSystem.dao.MovieRepository;
import com.infosys.movieSystem.dao.MovieShowDao;
import com.infosys.movieSystem.dao.MovieShowRepository;
import com.infosys.movieSystem.dao.ShowTimeDao;
import com.infosys.movieSystem.dao.ShowTimeRepository;
import com.infosys.movieSystem.dao.TicketBookingDao;
import com.infosys.movieSystem.service.MovieUserService;
import com.infosys.movieSystem.service.ShowTimeService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;

@RestController
public class MovieController {
	
	@Autowired
	private ShowTimeDao showTimeDao;
	@Autowired
	private MovieDao movieDao;
	
	@Autowired
	private ShowTimeService showTimeService;
	
	@Autowired
	private MovieShowDao movieShowDao;
	
	@Autowired
	private MovieUserService movieService;
	
	@Autowired
	private MovieUserService service;
	
	@Autowired
	private MovieRepository movieRepository;

	@Autowired
	private MovieShowRepository movieShowRepository;

	@Autowired
	private ShowTimeRepository showTimeRepository;
	
	@Autowired
    private TicketBookingDao ticketBookingDao;

	
	@GetMapping("/addShowTime")
	public ModelAndView showTimeEntryPage() {
		Integer newId = showTimeDao.generateShowTimeId();
		ShowTime showTime = new ShowTime(newId);
		ModelAndView mv = new  ModelAndView("showTimeEntryPage");
		mv.addObject("ShowTimeRecord",showTime);
		return mv;
	}
	
	@PostMapping("/addShowTime")
	public ModelAndView saveShowTimeEntryPage(@ModelAttribute("ShowTimeRecord") ShowTime showTime) {
		Double royalPrice = showTimeService.createRoyalPrice(showTime.getShowTimePremierPrice());
		showTime.setShowTimeRoyalPrice(royalPrice);
		showTimeDao.save(showTime);
		return new ModelAndView("redirect:/index");
		
	}
	
	@GetMapping("/showTimeReport")
	public ModelAndView showTimeReportPage() {
		List<ShowTime> showTimeList = showTimeDao.findAll();
		ModelAndView mv = new  ModelAndView("showTimeReportPage");
		mv.addObject("showTimeList",showTimeList);
		return mv;
	}
	
	@GetMapping("/showTimeDeletion/{id}")
	public ModelAndView deleteShowTime(@PathVariable Integer id) {
		showTimeDao.deleteShowTimeById(id);
		return new ModelAndView("redirect:/showTimeReport");
	}
	
	@GetMapping("/showTimeUpdation/{id}")
	public ModelAndView showShowTimeUpdatePage (@PathVariable Integer id) { 
		ShowTime showTime=showTimeDao.findById(id);
		ModelAndView mv= new ModelAndView("showTimeUpdatePage"); 
		mv.addObject("ShowTimeRecord",showTime);
		return mv;
	}
	
	@PostMapping("/showTimeUpdation")
	public String updateShowTimePremierPrice(
	        @RequestParam("showTimeId") Integer id,
	        @RequestParam("showTimePremierPrice") double premierPrice,
	        RedirectAttributes redirectAttributes) {

	    // Retrieve the showtime object from the database by ID
	    ShowTime showTime = showTimeDao.findById(id);

	    // Update only the premier price
	    showTime.setShowTimePremierPrice(premierPrice);

	    // Automatically calculate the royal price as 80% of the new premier price
	    double royalPrice = premierPrice * 0.25 + premierPrice;
	    showTime.setShowTimeRoyalPrice(royalPrice);

	    // Save the updated showtime back to the database
	    showTimeDao.save(showTime);  // save() for JPA, or updateShowTime() for JDBC

	    // Add a success message (optional)
	    redirectAttributes.addFlashAttribute("message", "Premier price updated successfully!");

	    // Redirect to the show time report page
	    return "redirect:/showTimeReport";
	}
	
	@GetMapping("/addMovie")
	public ModelAndView showMovieEntryPage() {
		String newId = movieDao.generateMovieId();
		Movie movie = new Movie(newId);
		List<Integer> showTimeList = showTimeDao.getAllIds();
		ModelAndView mv = new ModelAndView("movieEntryPage");
		mv.addObject("movieRecord",movie);
		mv.addObject("showTimeList",showTimeList);
		return mv;
	}
 
	@PostMapping("/addMovie")
	public ModelAndView saveMovieEntryPage(
	        @ModelAttribute("movieRecord") Movie movie, HttpServletRequest request) {
	    String movieId = movie.getMovieId();
	    movieDao.save(movie);  // Save the Movie entity
	    // Loop to process show times and seat types for this movie
	    for (int i = 1; i <= 6; i++) {
	        String premierSeat = request.getParameter("premier" + i);
	        if (premierSeat != null && !premierSeat.equals("---")) {
	            Integer showId = Integer.parseInt(request.getParameter("show" + i));
	            Integer premier = Integer.parseInt(premierSeat);
	            Integer royal = Integer.parseInt(request.getParameter("royal" + i));
	            MovieShowEmbed embed = new MovieShowEmbed(movieId, showId);	           
	            MovieShow movieShow = new MovieShow(embed,royal, premier);
	            movieShowDao.save(movieShow);
	        }
	    }
	    return new ModelAndView("redirect:/index"); 
	}
	
	@GetMapping("/movieReport")
	public ModelAndView showMovieReportPage() {

	    String page = "";
	    String role = service.getRole(); // Assuming `service.getRole()` returns the role of the current user

	    if (role.equalsIgnoreCase("Admin")) {
	        page = "movieReportAdminPage";
	    } else if (role.equalsIgnoreCase("Customer")) {
	        page = "movieReportCustomerPage";
	    }

	    // Fetch show times and map them by ID
	    List<ShowTime> showTimeList = showTimeDao.findAll();
	    Map<Integer, String> showMap = new HashMap<>();
	    for (ShowTime showTime : showTimeList) {
	        showMap.put(showTime.getShowTimeId(), showTime.getShowTimeName());
	    }

	    // Fetch all movies
	    List<Movie> movieList = movieDao.findAll();

	    // Fetch all movie shows
	    List<MovieShow> movieShowList = movieShowDao.findAll();

	    // Map movies to their respective show details
	    Map<String, List<MovieShowDTO>> movieMap = new HashMap<>();
	    for (Movie movie : movieList) {
	        List<MovieShowDTO> dtoList = new ArrayList<>();
	        String movieId = movie.getMovieId();

	        for (MovieShow movieShow : movieShowList) {
	            MovieShowEmbed id = movieShow.getEmbeddedId();

	            if (movieId.equals(id.getMovieId())) {
	            	Integer showTimeId=id.getShowTimeId();
	                String showTimeName = showMap.get(id.getShowTimeId());
	                Integer royalSeat = movieShow.getRoyalSeatNumber();
	                Integer premierSeat = movieShow.getPremierSeatNumber();
	                Integer royalBooked = movieShow.getRoyalBooked();
	                Integer premierBooked = movieShow.getPremierBooked();

	                MovieShowDTO movieShowDto = new MovieShowDTO(
	                    showTimeId,showTimeName, movieId, royalSeat, premierSeat, royalBooked, premierBooked
	                );
	                dtoList.add(movieShowDto);
	            }
	        }
	        movieMap.put(movieId, dtoList);
	    }

	    // Create the ModelAndView object with the selected page
	    ModelAndView mv = new ModelAndView(page);
	    mv.addObject("movieList", movieList);
	    mv.addObject("movieMap", movieMap);

	    return mv;
	}

	
	@GetMapping("/movieDeletion/{id}")
	public ModelAndView movieDeletion(@PathVariable String id) {
		List<MovieShowEmbed> embedList=movieShowDao.getAllIds();
		for(MovieShowEmbed mse:embedList) {
			if(id.equals(mse.getMovieId())) {
				MovieShowEmbed mse2=new MovieShowEmbed(id,mse.getShowTimeId());
				movieShowDao.deleteMovieShowById(mse2);
			}
		}
		movieDao.deleteMovieById(id);
		return new ModelAndView("redirect:/movieReport"); 
	}
	
	// Display the movie update page
	@GetMapping("/movieUpdate/{movieId}")
	public ModelAndView showMovieUpdatePage(@PathVariable String movieId) {
	    // Retrieve the movie by ID
	    Movie movie = movieDao.findById(movieId);

	    // Check if the movie exists
	    if (movie == null) {
	        return new ModelAndView("redirect:/movieReport"); // Redirect if movie not found
	    }

	    // Pass the movie object to the view
	    ModelAndView mv = new ModelAndView("movieUpdatePage");
	    mv.addObject("movie", movie);
	    return mv;
	}

	// Handle the movie update form submission
	@PostMapping("/movieUpdate")
	public ModelAndView updateMovieRating(
	        @RequestParam("movieId") String movieId,
	        @RequestParam("rating") double rating,
	        RedirectAttributes redirectAttributes) {

	    Movie movie = movieDao.findById(movieId);
	    if (movie == null) {
	        return new ModelAndView("redirect:/movieReport"); // Redirect if movie not found
	    }

	    // Update only the rating
	    movie.setRating(rating);
	    movieDao.save(movie);  // Save the updated movie rating

	    redirectAttributes.addFlashAttribute("message", "Rating updated successfully!");
	    return new ModelAndView("redirect:/movieReport");
	}

	@GetMapping("/updateMovieShow/{id}")
	public ModelAndView showMovieShowUpdatePage (@PathVariable String id) { 
    Movie movie=movieDao.findById(id);
	List<Integer> showTimeList=showTimeDao.getAllIds();
	ModelAndView mv=new ModelAndView("movieShowUpdatePage");
	mv.addObject("movie",movie);
	mv.addObject("showTimeList", showTimeList);
	return mv;
	}


	@PostMapping("/updateMovieShow")
	public ModelAndView saveMovieShowUpdatePage(HttpServletRequest request) {
	    String movieId = request.getParameter("movieId");
	    
	    // Retrieve the list of MovieShowEmbed IDs for the movie
	    List<MovieShowEmbed> embedList = movieShowDao.getAllIds();
	    
	    // Delete existing showtime entries for this movie
	    for (MovieShowEmbed mse : embedList) {
	        if (movieId.equals(mse.getMovieId())) {
	            MovieShowEmbed mse2 = new MovieShowEmbed(movieId, mse.getShowTimeId());
	            movieShowDao.deleteMovieShowById(mse2);
	        }
	    }

	    // Loop to process updated show times and seat types for this movie
	    for (int i = 1; i <= 6; i++) {
	        String premierSeat = request.getParameter("premier" + i);
	        String showIdParam = request.getParameter("show" + i);
	        String royalSeatParam = request.getParameter("royal" + i);
	        
	        // Check if show time and seat details are provided
	        if (premierSeat != null && !premierSeat.equals("---") && showIdParam != null && royalSeatParam != null) {
	            Integer showId = Integer.parseInt(showIdParam);
	            Integer premier = Integer.parseInt(premierSeat);
	            Integer royal = Integer.parseInt(royalSeatParam);
	            
	            // Create new MovieShowEmbed and MovieShow instances
	            MovieShowEmbed embed = new MovieShowEmbed(movieId, showId);
	            MovieShow movieShow = new MovieShow(embed, royal, premier);
	            
	            // Save the new or updated MovieShow entry
	            movieShowDao.save(movieShow);
	        }
	    }

	    return new ModelAndView("redirect:/movieReport");
	}

	
	@GetMapping("/movieReportLanguage")
	public ModelAndView showSelectLangaugaePage() {
	Set<String> languageSet=movieDao.getAllLanguages(); 
	    String page="";
	    String role = service.getRole(); // Assuming `service.getRole()` returns the role of the current user

	    if (role.equalsIgnoreCase("Admin")) {
	    	page="movieReportByLanguageAdmin";
	    } else if (role.equalsIgnoreCase("Customer")) {
	    	page="movieReportByLanguageCustomer";
	    }
	    ModelAndView mv=new ModelAndView(page);
   	    mv.addObject("languageSet", languageSet);
	    return mv;

	}
	
	@PostMapping("/movieReportLanguage")
	public ModelAndView showMovieReportByLanguagePage(@RequestParam("language") String language) {
	    // Retrieve all show times
	    List<ShowTime> showTimeList = showTimeDao.findAll();
	    Map<Integer, String> showMap = new HashMap<>();
	    for (ShowTime showTime : showTimeList) {
	        showMap.put(showTime.getShowTimeId(), showTime.getShowTimeName());
	    }

	    // Retrieve movies based on the selected language
	    List<Movie> movieList = movieDao.getLanguagewiseMovieList(language);

	    // Retrieve all movie shows
	    List<MovieShow> movieShowList = movieShowDao.findAll();

	    // Map to store movie details by movie ID
	    Map<String, List<MovieShowDTO>> movieMap = new HashMap<>();
	    for (Movie movie : movieList) {
	        List<MovieShowDTO> dtoList = new ArrayList<>();
	        String movieId = movie.getMovieId();

	        for (MovieShow movieShow : movieShowList) {
	            MovieShowEmbed id = movieShow.getEmbeddedId();

	            // Check if the current show is for the current movie
	            if (movieId.equals(id.getMovieId())) {
	                String showTimeName = showMap.get(id.getShowTimeId());
	                Integer royalSeat = movieShow.getRoyalSeatNumber();
	                Integer premierSeat = movieShow.getPremierSeatNumber();

	                // Create DTO object to store movie show details
	                MovieShowDTO dto = new MovieShowDTO();
	                dto.setShowTimeName(showTimeName);
	                dto.setRoyalSeat(royalSeat);
	                dto.setPremierSeat(premierSeat);

	                // Add DTO to list for this movie
	                dtoList.add(dto);
	            }
	        }

	        // Store the list of shows for each movie in the map
	        movieMap.put(movieId, dtoList);
	    }

	    // Create ModelAndView to pass data to the view
	    String page="";
	    String role = service.getRole(); // Assuming `service.getRole()` returns the role of the current user

	    if (role.equalsIgnoreCase("Admin")) {
	    	page="movieReportByLanguageAdmin";
	    } else if (role.equalsIgnoreCase("Customer")) {
	    	page="movieReportByLanguageCustomer";
	    }
	    ModelAndView mv=new ModelAndView(page);
	    mv.addObject("movieList", movieList);
	    mv.addObject("movieMap", movieMap);
	    mv.addObject("selectedLanguage", language);
	    
	    return mv;
	}

	@GetMapping("/bookMovie/{id}")
	public ModelAndView showBookMoviePage(@PathVariable String id) {

	    // Fetch the movie details using the provided ID
	    Movie movie = movieDao.findById(id);

	    // Get the movie ID
	    String movieId = movie.getMovieId();

	    // Fetch all MovieShowEmbed entities
	    List<MovieShowEmbed> embedList = movieShowDao.getAllIds();

	    // Prepare a list to hold MovieShowDTO objects
	    List<MovieShowDTO> movieShowDTOList = new ArrayList<>();

	    // Iterate through embedList and filter by movieId
	    for (MovieShowEmbed mse : embedList) {
	        if (movieId.equals(mse.getMovieId())) {
	            MovieShowEmbed mse2 = new MovieShowEmbed(movieId, mse.getShowTimeId());
	            MovieShow movieShow = movieShowDao.getMovieShowById(mse2);

	            // Fetch the show time name
	            String showTimeName = showTimeDao.getShowTimeName(mse.getShowTimeId());

	            // Create a MovieShowDTO object
	            MovieShowDTO movieShowDTO = new MovieShowDTO(showTimeName,movieId,movieShow.getRoyalSeatNumber(),movieShow.getPremierSeatNumber(),
	                    movieShow.getRoyalSeatNumber() - movieShow.getRoyalBooked(),
	                    movieShow.getPremierSeatNumber() - movieShow.getPremierBooked());

	            // Add to the movieShowDTOList
	            movieShowDTOList.add(movieShowDTO);
	        }
	    }

	    // Create a ModelAndView object and populate it with data
	    ModelAndView mv = new ModelAndView("movieBookPage");
	    mv.addObject("movie", movie);
	    mv.addObject("movieShowDTOList", movieShowDTOList);

	    return mv;
	}

	
	@PostMapping("/bookMovie/{id}")
	public ModelAndView bookMovie(
	        @PathVariable String id,
	        @RequestParam(value = "selection", required = false) String showTimeName) {

	    // Fetch the movie details
	    Movie movie = movieDao.findById(id);
	    if (movie == null) {
	        return new ModelAndView("bookErrorPage", "errorMessage", "Movie not found.");
	    }

	    // Initialize the selected show
	    MovieShow selectedShow = null;

	    // Fetch all show embeddings for the movie
	    List<MovieShowEmbed> embedList = movieShowDao.getAllIds();
	    if (embedList != null && !embedList.isEmpty()) {
	        for (MovieShowEmbed mse : embedList) {
	            // Match the movie ID
	            if (id.equals(mse.getMovieId())) {
	                Integer showTimeId = mse.getShowTimeId();
	                if (showTimeId == null) continue;

	                // Fetch the show time name
	                String fetchedShowTimeName = showTimeDao.getShowTimeName(showTimeId);
	                if (fetchedShowTimeName != null && fetchedShowTimeName.equals(showTimeName)) {
	                    // Fetch the selected MovieShow using MovieShowEmbed
	                    selectedShow = movieShowDao.getMovieShowById(mse);
	                    break;
	                }
	            }
	        }
	    }

	    // Handle case where no matching show is found
	    if (selectedShow == null) {
	        // Fetch all shows again and prepare the DTO list
	        List<MovieShowEmbed> allEmbeds = movieShowDao.getAllIds();
	        List<MovieShowDTO> movieShowDTOList = new ArrayList<>();
	        for (MovieShowEmbed mse : allEmbeds) {
	            if (id.equals(mse.getMovieId())) {
	                MovieShow movieShow = movieShowDao.getMovieShowById(mse);
	                String showTimeNameFetched = showTimeDao.getShowTimeName(mse.getShowTimeId());
	                movieShowDTOList.add(new MovieShowDTO(
	                        showTimeNameFetched,
	                        id,
	                        movieShow.getRoyalSeatNumber(),
	                        movieShow.getPremierSeatNumber(),
	                        movieShow.getRoyalSeatNumber() - movieShow.getRoyalBooked(),
	                        movieShow.getPremierSeatNumber() - movieShow.getPremierBooked()
	                ));
	            }
	        }

	        ModelAndView mv = new ModelAndView("movieBookPage");
	        mv.addObject("movie", movie);
	        mv.addObject("movieShowDTOList", movieShowDTOList);
	        mv.addObject("errorMessage", "Selected show not found or unavailable. Please try again.");
	        return mv;
	    }

	    // Prepare the confirmation view
	    ModelAndView mv = new ModelAndView("TicketPay");
	    mv.addObject("movie", movie);
	    mv.addObject("selectedShow", selectedShow);
	    mv.addObject("showTimeName", showTimeName);
	    return mv;
	}

	@GetMapping("/ticketPay/{id}")
	public ModelAndView showTicketPayPage(
	        @PathVariable String id,
	        @RequestParam(value = "selection") String showTimeName,
	        @RequestParam(value = "seatType") String seatType,
	        @RequestParam(value = "numberOfSeats") int numberOfSeats) {

	    // Fetch the movie details
	    Movie movie = movieDao.findById(id);
	    if (movie == null) {
	        return new ModelAndView("bookErrorPage", "errorMessage", "Movie not found.");
	    }

	    // Fetch the show time details
	    ShowTime showTime = showTimeDao.getShowTime(showTimeName);
	    if (showTime == null) {
	        return new ModelAndView("bookErrorPage", "errorMessage", "Show time not found.");
	    }

	    // Calculate total amount
	    double seatPrice = seatType.equalsIgnoreCase("Royal") 
	        ? showTime.getShowTimeRoyalPrice() 
	        : showTime.getShowTimePremierPrice();
	    double totalAmount = numberOfSeats * seatPrice;

	    // Prepare the data to pass to the JSP
	    ModelAndView mv = new ModelAndView("TicketPay");
	    mv.addObject("movieName", movie.getMovieName());
	    mv.addObject("showTimeName", showTime.getShowTimeName());
	    mv.addObject("seatType", seatType);
	    mv.addObject("numberOfSeats", numberOfSeats);
	    mv.addObject("totalAmount", totalAmount);

	    return mv;
	}

	@PostMapping("/ticketPay/{id}")
	public ModelAndView bookTicket(
	        @PathVariable String id,
	        @RequestParam(value = "selection") String showTimeName,
	        @RequestParam(value = "seatType") String seatType,
	        @RequestParam(value = "numberOfSeats") int numberOfSeats,
	        @RequestParam(value = "transactionId") String transactionId) {

	    // Fetch the movie details
	    Movie movie = movieDao.findById(id);
	    if (movie == null) {
	        return new ModelAndView("bookErrorPage", "errorMessage", "Movie not found.");
	    }

	    // Fetch the show time details
	    ShowTime showTime = showTimeDao.getShowTime(showTimeName);
	    if (showTime == null) {
	        return new ModelAndView("bookErrorPage", "errorMessage", "Show time not found.");
	    }

	    // Fetch the MovieShow record for the booking
	    MovieShowEmbed movieShowEmbed = new MovieShowEmbed(id, showTime.getShowTimeId());
	    MovieShow movieShow = movieShowDao.getMovieShowById(movieShowEmbed);
	    if (movieShow == null) {
	        return new ModelAndView("bookErrorPage", "errorMessage", "Movie show not found.");
	    }

	    // Update seat booking details
	    if (seatType.equalsIgnoreCase("Royal")) {
	        if (numberOfSeats > (movieShow.getRoyalSeatNumber() - movieShow.getRoyalBooked())) {
	            return new ModelAndView("bookErrorPage", "errorMessage", "Insufficient Royal seats available.");
	        }
	        movieShow.setRoyalBooked(movieShow.getRoyalBooked() + numberOfSeats);
	    } else {
	        if (numberOfSeats > (movieShow.getPremierSeatNumber() - movieShow.getPremierBooked())) {
	            return new ModelAndView("bookErrorPage", "errorMessage", "Insufficient Premier seats available.");
	        }
	        movieShow.setPremierBooked(movieShow.getPremierBooked() + numberOfSeats);
	    }

	    // Save the updated movie show
	    movieShowDao.save(movieShow); // Using save() instead of update()

	    // Pass booking details to the JSP
	    ModelAndView mv = new ModelAndView("TicketConfirmation");
	    mv.addObject("movieName", movie.getMovieName());
	    mv.addObject("showTimeName", showTime.getShowTimeName());
	    mv.addObject("seatType", seatType);
	    mv.addObject("numberOfSeats", numberOfSeats);
	    mv.addObject("transactionId", transactionId);
	    mv.addObject("totalAmount", numberOfSeats * (seatType.equalsIgnoreCase("Royal")
	            ? showTime.getShowTimeRoyalPrice() : showTime.getShowTimePremierPrice()));
	    return mv;
	}

	
    
}
