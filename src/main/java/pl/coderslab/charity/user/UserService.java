package pl.coderslab.charity.user;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

    User findByEmail(String email);
    void save(User user);   // like register
}
