package se.zust.service;

import se.zust.dao.UserDao;
import se.zust.entity.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

    public void addUser(User user) {
        userDao.addUser(user);
    }
    public User selectUserByName(String username){
        return userDao.selectUserByName(username);
    }
    public List<User> selectUserByDirector(String director){
    	return userDao.selectUserByDirector(director);
    }
    public User selectUserById(int director){
    	return userDao.selectUserById(director);
    }
    public void addNormalUser(User user) {
    	userDao.addNormalUser(user);
    }
    public void deleteNormalUser(int id) {
    	userDao.deleteNormalUser(id);
    }
    public void updateUser(User user){
    	userDao.updateUser(user);
    }
}
