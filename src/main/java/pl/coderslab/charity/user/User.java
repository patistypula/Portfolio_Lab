package pl.coderslab.charity.user;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.charity.role.Role;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = User.TABLE)
public class User {
    public final static String TABLE = "user";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email
    @Column(nullable = false, unique = true)
    private String email;
    private String password;
    private int enabled;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    public User(){
        roles = new HashSet<>();
    }
}
