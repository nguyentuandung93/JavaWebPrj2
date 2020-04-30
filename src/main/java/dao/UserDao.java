package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserModel;
import utils.DBConnection;

public class UserDao {
	public int getUserId(UserModel userModel) throws ClassNotFoundException {
		int id = 0;
		String sql = "SELECT * FROM m_user WHERE username = ? and password = ? ";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getUsername());
			preparedStatement.setString(2, userModel.getPassword());
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				id = rs.getInt("id");
			} else {
				id = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public boolean issetUser(String userName) throws ClassNotFoundException {
		boolean status = false;
		String sql = "SELECT * from m_user where username = ?";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public int addUser(UserModel userModel) throws ClassNotFoundException {
		int result = 0;
		String sql = "INSERT INTO m_user(username, password, image_real_name, image_name, regist_date) VALUES (?, ?, ?, ?, ?);";
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getUsername());
			preparedStatement.setString(2, userModel.getPassword());
			preparedStatement.setString(3, userModel.getImage_real_name());
			preparedStatement.setString(4, userModel.getImage_name());
			preparedStatement.setString(5, userModel.getRegist_date());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// ユーザー情報を取得
	public UserModel getUserInfo(UserModel userModel) throws ClassNotFoundException {
		String sql = "SELECT * FROM m_user WHERE id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, Integer.toString(userModel.getId()));
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				userModel.setId(rs.getInt("id"));
				userModel.setName(rs.getString("name"));
				userModel.setEmail(rs.getString("email"));
				userModel.setImage_real_name(rs.getString("image_real_name"));
				userModel.setImage_name(rs.getString("image_name"));
				userModel.setRegist_date(rs.getString("regist_date"));
				userModel.setUpdate_date(rs.getString("update_date"));
				userModel.setLast_login(rs.getString("last_login"));
				userModel.setThis_login(rs.getString("this_login"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userModel;
	}
	// ユーザーログイン情報を更新
	public int updateUserLogin(UserModel userModel) throws ClassNotFoundException {
		int result = 0;
		String sql = "UPDATE m_user SET last_login = ?, this_login = ? WHERE id = ?;";
		Connection connection = DBConnection.getConnection();
		try {
			
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userModel.getLast_login());
			preparedStatement.setString(2, userModel.getThis_login());
			preparedStatement.setString(3, Integer.toString(userModel.getId()));
			System.out.println(preparedStatement);

			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	// ユーザー情報を更新
	public int updateUser(UserModel userModel) throws ClassNotFoundException {
		int result = 0;
		return result;
	}
}
