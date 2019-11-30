package org.bandtracker.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.bandtracker.hibernate.entity.User;

public class UserModel {

	public Boolean addUser(DataSource dataSource, User newUser) {
		Connection connect = null;
		PreparedStatement statement = null;
		try {
			connect = dataSource.getConnection();
			
			String username = newUser.getUsername();
			String password = newUser.getPassword();
			String user_type = newUser.getUserType();
			String public_name = newUser.getPublicName();
			String first_name = newUser.getFirstName();
			String last_name = newUser.getLastName();
			String street_address = newUser.getStreetAddress();
			String town = newUser.getTown();
			String zip_code = newUser.getZipCode();
			String email = newUser.getEmail();
			String phone = Integer.toString(newUser.getPhone());
			
			String query = "insert into users (username, password,"
					+ "user_type, public_name, first_name, last_name,"
					+ "street_address, town, zip_code, email, phone)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println(query);
			statement = connect.prepareStatement(query);
			
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, user_type);
			statement.setString(4, public_name);
			statement.setString(5, first_name);
			statement.setString(6, last_name);
			statement.setString(7, street_address);
			statement.setString(8, town);
			statement.setString(9, zip_code);
			statement.setString(10, email);
			statement.setString(11, phone);
			
			System.out.println(statement);
			
			return statement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
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
	
	public List<User> listUsers(DataSource dataSource, String type) {
		List<User> listUsers = new ArrayList<>();
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String type1=null, type2=null;
		type = type.toLowerCase();
		System.out.println("Type:" + type);
		
		switch (type) {
		case "bar":
			type = "band";
			break;
		case "band":
			type = "bar";
		case "fan":
			type1 = "band";
			type2 = "bar";
			break;
		}
		
		try {
			System.out.println(type);
			connect = dataSource.getConnection();
			String query = "Select * from users where user_type=?";
			if(type.equals("fan")) {
				query = query + "or user_type=?";
			}
			stmt = connect.prepareStatement(query);
			if(type.equals("fan")) {
				stmt.setString(1, type1);
				stmt.setString(2, type2);
			}
			else {
				stmt.setString(1, type);
			}
			System.out.println(stmt);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				listUsers.add(new User(rs.getInt("user_ID"), rs.getString("username"),  rs.getString("user_type"),
						rs.getBoolean("is_admin"), rs.getString("public_name"), rs.getString("first_name"),
						rs.getString("last_name"), rs.getString("street_address"), rs.getString("town"),
						rs.getString("zip_code"), rs.getString("email"), rs.getInt("phone"),
						rs.getString("website_URL"), rs.getString("password"), rs.getString("bio")				
						));
			}
			System.out.println(listUsers);
			return listUsers;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listUsers;
	}

	
}
