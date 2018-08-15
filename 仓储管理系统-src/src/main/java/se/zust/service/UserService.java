package se.zust.service;

import java.util.List;

import se.zust.entity.User;

public interface UserService {
	
	public void addUser(User user);
	
	public User selectUserByName(String username);
	
	public List<User> selectUserByDirector(String director);
	
//	public List<User> selectUserByDirector(int director);
	
	public User selectUserById(int id);
	
	public void addNormalUser(User user);
	   
    public void deleteNormalUser(int id); 
    
    public void updateUser(User user);
    
    

}
