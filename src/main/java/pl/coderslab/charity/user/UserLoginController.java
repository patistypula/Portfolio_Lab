package pl.coderslab.charity.user;

import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@AllArgsConstructor
public class UserLoginController {
    private final SpringDataUserDetailsService springDataUserDetailsService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final UserService userService;

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public String getLogin(@RequestParam String email, @RequestParam String password){
        System.out.println("tutaj");
        UserDetails user = springDataUserDetailsService.loadUserByUsername(email);
        if(!passwordEncoder.matches(password, user.getPassword())){
            return "/login";
        }
        return "redirect:/form";

    }

    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setEmail("admin@wp.pl");
        user.setPassword("admin");
        userService.save(user);
        return user.toString();
    }
}
