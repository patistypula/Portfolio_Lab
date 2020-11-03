package pl.coderslab.charity.user;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

    User findByUsername(String username);
    void save(User user);   // like register
}
