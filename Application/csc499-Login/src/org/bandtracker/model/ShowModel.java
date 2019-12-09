package org.bandtracker.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.bandtracker.hibernate.entity.Booking;
import org.bandtracker.hibernate.entity.Show;
import org.bandtracker.hibernate.entity.User;

public class ShowModel {

	public Boolean addShow(DataSource dataSource, Show show, int bar_id) {
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
			
			String query = "insert into shows (start_datetime, end_datetime)"
					+ "values(?,?)";
			statement = connect.prepareStatement(query);
			statement.setString(1, show.getStartDatetime());
			statement.setString(2, show.getEndDatetime());
			System.out.println(statement);
			
			return statement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Boolean getShowById(DataSource dataSource, Show show, int bar_id) {
		Connection connect = null;
		PreparedStatement statement = null;
		
		try {
			connect = dataSource.getConnection();
			
			String query = "select show_ID from shows"
					+ "where ";
			statement = connect.prepareStatement(query);
			statement.setString(1, show.getStartDatetime());
			statement.setString(2, show.getEndDatetime());
			System.out.println(statement);
			
			return statement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public int getBarIdByShowId(DataSource dataSource, int showId) {
		Connection connect = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		int barId = 0;
		
		try {
			connect = dataSource.getConnection();
			
			String query = "select bar_id from ShowVenues "
					+ "where show_id=?";
			statement = connect.prepareStatement(query);
			statement.setInt(1, showId);
			System.out.println(statement);
			
			rs = statement.executeQuery();
			rs.next();			
			barId = rs.getInt("bar_id");
			System.out.println("BarId: " + barId);
			
			return barId;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return barId;
		}
	}
	
	public String getBarNameByShowId(DataSource dataSource, int showId) {
		Connection connect = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		String barName = null;
		
		try {
			connect = dataSource.getConnection();
			
			String query = "SELECT u.public_name as Bar from Users u\n" + 
					"JOIN ShowVenues sv on sv.bar_ID=u.user_ID\n" + 
					"JOIN Shows s on s.show_ID=sv.show_ID\n" + 
					"WHERE s.show_ID=?;";
			statement = connect.prepareStatement(query);
			statement.setInt(1, showId);
			System.out.println(statement);
			
			rs = statement.executeQuery();
			System.out.println(rs.next());			
			barName = rs.getString("Bar");
			System.out.println("Bar: " + barName);
			
			return barName;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return barName;
		}
	}
	
	public List<User> validateCredentials(DataSource dataSource, String usrnm, String pw) {
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Boolean match = false;
		List<User> user = new ArrayList<>();

		try {
			connect = dataSource.getConnection();
			
			String query = "Select * from users where username = ? and password = ?";
			stmt = connect.prepareStatement(query);
			stmt.setString(1, usrnm);
			stmt.setString(2, pw);
			System.out.println(stmt);
			
			rs = stmt.executeQuery();
	
			match = rs.next();
			if(match) {
				user.add(new User(
						rs.getInt("user_ID"), rs.getString("username"),  rs.getString("user_type"),
						rs.getBoolean("is_admin"), rs.getString("public_name"), rs.getString("first_name"),
						rs.getString("last_name"), rs.getString("street_address"), rs.getString("town"),
						rs.getString("zip_code"), rs.getString("email"), rs.getInt("phone"),
						rs.getString("website_URL"), rs.getString("password"), rs.getString("bio")				
						));
				System.out.println(user);
			}
			
			return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
			//FIXME add handler for case where username is taken
		}
		
		return user;
		
	}
	
	public List<Object> listShowsWithVenue(DataSource dataSource) {
		List<Object> listShows = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			connect = dataSource.getConnection();
			String query = "SELECT u.public_name, u.town, u.state, s.* from Users u\n" + 
					"JOIN ShowVenues sv on sv.bar_ID=u.user_ID\n" + 
					"JOIN Shows s on s.show_ID=sv.show_ID;";

			stmt = connect.prepareStatement(query);

			rs = stmt.executeQuery();
			
			while(rs.next()) {
				List<Object> show = Arrays.asList(rs.getString("public_name"),
						rs.getString("town"),
						rs.getString("state"),
						rs.getInt("show_ID"),
						rs.getString("start_datetime"),
						rs.getString("end_datetime"),
						rs.getString("show_name"),
						rs.getString("show_description")
						);
				listShows.add(show);
			}
			System.out.println(listShows);
			return listShows;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listShows;
	}
	
}
